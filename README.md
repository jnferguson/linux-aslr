Linux ASLR is broken.

Basically, with a few reasonable preconditions, you can turn the leak of a single mmap to a full ASLR compromise. Moreover, in some one-off contexts that are admittedly semi-rare, you should be able to *blindly* bypass linux ASLR.

The pre-conditions are:
- You can access the same binary; id est RPM
- You know the order of the allocations in question; this is more trivial than it sounds given the prefork unix service model

If you can take the result of an allocation that results in a call to mmap() and turn your pointer into it into the base address
of the mapping, then you can perform simple arithmetic upon this pointer to discern the address of any module in the address space.

The fix should be:
- Introduce more entropy into the allocator; specifically see how OpenBSD uses arc4 to do this.
- Randomize module load order
- Remove the mmap base bias that puts mappings at predictable locations within the address space


The raw directory contains a series of outputs of /proc/$pid/map for a bunch of vsftp processes (service restarted each time) that demonstrates that the SPACE BETWEEN MODULES IS NOT RANDOMIZED; meaning any individual leak can compromise the entire address space. As noted above, there should be instances where this can be leveraged blindly, for instance on the version of python on my linux box, running the following: print(hex((id("__main__") & ~4095) - 0xb4f000)) yields the base address of libc's text segment. In other contexts, if you can leak the right vptr's and then reuse instructions that emulate the page size bitwise and and the subtraction (or addition), then you could then use the pointer to start ROP/etc chains without knowing/leaking the address in question.
