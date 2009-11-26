#include <unistd.h>
#include <sys/types.h>
#include <fcntl.h>
#include <malloc.h>
#include <sys/stat.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>

int main (int argc,char *argv[]) {
  char *n0 = NULL;
  struct stat *buf1 = NULL;
  int ret = 0;

  n0 = argv[1];
  buf1 = calloc (1, sizeof (*buf1));
  gid_t list[3] = {65533, 65532, 65531};

  creat (n0, 0644);
  chown (n0, 65534, 65533);
  chmod (n0, 06555);

  setgroups (3, &list);
  setuid (65534);

  chown (n0, 65534, 65532);
  ret = stat (n0, buf1);
  if (ret == -1) {
	printf ("stat error, error no = %d",errno);
        exit (EXIT_FAILURE);
  }
  if (buf1->st_gid != 65532)
        exit (EXIT_FAILURE);

  free (buf1);
  
  exit (EXIT_SUCCESS);
}
