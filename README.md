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
