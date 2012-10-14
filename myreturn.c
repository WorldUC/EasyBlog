#include <stdio.h>

int main()
{
   int me;

   me=fgetc(stdin);   

   while(me!=EOF)
   {
      if(me!=0x0d)
        printf("%c",me);
      me=fgetc(stdin);
   }

   return 0;
} 
