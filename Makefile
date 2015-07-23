
all:
	gcc -O2 -s -o mmap mmap.c -fpic -pie
clean:
	@rm -f mmap
