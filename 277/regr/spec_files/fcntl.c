#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<errno.h>

int main(int argc, char *argv[])
{
  int fd;
  int dup_fd;
  fd = open (argv[1], O_RDONLY | O_CREAT,0755);
  if (fd == -1) {
    return errno;
  } else {
    dup_fd = fcntl(fd, F_DUPFD);
  }
  if ( dup_fd == -1) {
    return errno;
  } else
    return 0;
}
  
