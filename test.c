#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>

extern int my_strlen(char *);
extern char *my_strchr(char *, char);
extern char *my_index(char *, int);
extern int my_read(int, void *, int);
extern int my_write(int, void *, int);
extern int my_strcmp(char *, char *);
extern int my_strncmp(char *, char *, int);
extern int my_strcasecmp(char *, char *);
extern char *to_lower(char *);
extern void *my_memset(void *, int , size_t);
extern void *my_memcpy(void *, void *, size_t);
extern void *my_memmove(void *, void *, size_t);

int main(void) {

    //Test my_strchr
  printf("==========my_strchr==========\n");
  printf("Expected: [CDE12345Z] -> Result:[%s]\n", my_strchr("ABCDE12345Z", 'C'));
  printf("=============================\n");

  //Test my_strlen
  printf("==========my_strlen==========\n");    
  printf("Expected:[5] -> Result:[%d]\n", my_strlen("ABCDE"));
  printf("=============================\n");

  //Test my_index
  printf("==========my_strchr==========\n");
  printf("Expected:[DE] -> Result:[%s]\n", my_index("ABCDE", 68));
  printf("=============================\n");
    
  //Test my_read
  printf("==========my_read============\n");
  int fd = 0;
  fd = open("README.md", O_RDONLY);
  char buf[100];
  printf("READ return %d\n", my_read(fd, buf, 8));
  buf[8] = '\0';
  printf("Expected:[# my_lib] -> Result:[%s]\n", buf);
  printf("=============================\n");
    
  //Test my_write
  printf("==========my_write===========\n");
  int status_w = my_write(1, "hello\n", 6);
  printf("Expected:[6] -> Result:[%d]\n", status_w);
  status_w = my_write(200, "hello", 5);
  printf("Expected:[-1] -> Result:[%d]\n", status_w);
  printf("=============================\n");
    
  //Test my_strcmp
  printf("==========my_strcmp==========\n");
  printf("Expected:[%d] -> Result:[%d]\n", strcmp("ABC", "ABC"), my_strcmp("ABC", "ABC"));
  printf("Expected:[%d] -> Result:[%d]\n", strcmp("ABC", "AB"), my_strcmp("ABC", "AB"));
  printf("Expected:[%d] -> Result:[%d]\n", strcmp("AB", "ABC"), my_strcmp("AB", "ABC"));    
  printf("=============================\n");

  //my_strncmp
  printf("==========my_strncmp==========\n");
  printf("Expected:[%d] -> Result:[%d]\n", strncmp("ABC", "ABC", 3), my_strncmp("ABC", "ABC", 3));
  printf("Expected:[%d] -> Result:[%d]\n", strncmp("ABCDEF", "ABCGHR", 4), my_strncmp("ABCDEF", "ABCGHR", 4));
  printf("Expected:[%d] -> Result:[%d]\n", strncmp("AB", "ABC", 3), my_strncmp("AB", "ABC", 3));    
  printf("==============================\n");    


    //my_strcasecmp
  printf("==========my_strcasecmp==========\n");
  printf("Expected:[%d] -> Result:[%d]\n", strcmp("ABC", "ABC"), my_strcasecmp("ABC", "ABC"));
  printf("Expected:[%d] -> Result:[%d]\n", strcmp("ABC", "AB"), my_strcasecmp("ABC", "AB"));
  printf("Expected:[%d] -> Result:[%d]\n", strcmp("ABC", "AB"), my_strcasecmp("ABC", "AB"));
  printf("==================================\n");    

  //my_memset
  char *dst = (char*)memset(dst, 65, 3);
  char *m_dst = (char*)my_memset(m_dst, 65, 3);
  printf("==========my_memset===============\n");
  printf("Expected:[%s] -> Result:[%s]\n", dst, m_dst);
  printf("==================================\n");

  //my_memcpy
  char *dst_cpy = (char*)memcpy(dst, "ABC", 5);
  char m_dst_cpy[] = "coco";
  my_memcpy(m_dst_cpy, "ABC", 5);
  printf("==========my_memcpy===============\n");
  printf("Expected:[%s] -> Result:[%s]\n", dst_cpy, m_dst_cpy);
  printf("==================================\n");

  //my_memmove
  char *dst_mov = (char*)memmove(dst, "ABC", 5);
  char m_dst_mov[] = "coco";
  my_memmove(m_dst_mov, "ABC", 5);
  printf("==========my_memmove==============\n");
  printf("Expected:[%s] -> Result:[%s]\n", dst_mov, m_dst_mov);
  printf("==================================\n");  
  
  return 0;
}
