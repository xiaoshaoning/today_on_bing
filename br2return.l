%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
\<br\>             {
                       printf("\n");
                   }
%%

int main(int argc, char ** argv)
{
    if (argc > 1)
    {
        if ( (yyin = fopen(argv[1], "r")) == 0 )
        {
            perror(argv[1]);
            exit(1);
        }
    }

    yylex();

    return 0;
}
