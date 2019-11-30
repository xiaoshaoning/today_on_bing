%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int url_length;
char * url;

%}

%%
\n
copyrightlink\"\:\"\/search\?q\=[a-zA-Z0-9\+\\\%\=\_\&\- ]+\"\,   {
                                                                      url_length = strlen(yytext);
                                                                      url = (char *) malloc(sizeof(char) * url_length);
                                                                      memset(url, '\0', url_length);
                                                                      strncpy(url, yytext+17, url_length-19);
                                                                      printf("%s\n", url);
                                                                      free(url);
                                                                  }
.
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
