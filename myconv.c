#include <stdio.h>

int main()
{
   int me;

   me=fgetc(stdin);   

   while(me!=EOF)
   {
      printf("%%%02hhX",(unsigned char)me);
      me=fgetc(stdin);
   }

   return 0;
} 
