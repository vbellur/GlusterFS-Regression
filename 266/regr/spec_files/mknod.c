#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>
#include <stdio.h>

int main (int argc, char *argv[]) 
{

	int ret = -1;

	ret = mknod (argv[1] , S_IFREG | 0644, 0);

	if(ret == 0)
	  return ret;
	else
	  return errno;
}
