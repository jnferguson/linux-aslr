#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

signed int
main(void)
{
	char* ptr = malloc(256*1024);
	//printf("ptr: %p\n", ptr);
	printf("libc: %p\n", (ptr-16-0x564000));
	sleep(60*1);
	return EXIT_SUCCESS;
}
