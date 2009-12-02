#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>
#include <dirent.h>
#include <sys/types.h>
#include <fcntl.h>
#include <errno.h>

int main(int argc, char *argv[])
{
  DIR *dir;
  dir = opendir(argv[1]);
  if ( dir == NULL ) {
    return errno;
  }
  else {
    closedir(dir);
    return 0;
  }
}
