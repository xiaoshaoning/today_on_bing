%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int title_length;
char * title;

int content_length;
char * content;

%}

%%
\n
ency\_desc\".[0-9A-Za-z\?\.\'\(\)\,\-\`\;\–\n\— ]+[\<br\>]+[0-9A-Za-z\?\.\'\(\)\,\-\`\;\–\n\— ]+.  {   title_length = strlen(yytext+11);
                                                                                                       title = (char *) malloc(sizeof(char) * strlen(yytext));
                                                                                                       memset(title, '\0', title_length);
                                                                                                       strncpy(title, yytext+11, title_length - 1);
                                                                                                       printf("%s\n", title);
                                                                                                       free(title);
                                                                                                   }
ency\_desc\<\/span\>\"\&gt\;\<\/span\>[ \t0-9A-Za-z\'\(\)\,\.\?\;]+\<span               {
                                                                                          content_length = strlen(yytext+11);
                                                                                          content = (char *) malloc(sizeof(char) * strlen(yytext));
                                                                                          memset(content, '\0', content_length);
                                                                                          strncpy(content, yytext+28, content_length - 18);
                                                                                          printf("%s\n", content);
                                                                                          free(content);
                                                                                      }
ency\_imgTitle\".[ \t0-9A-Za-z\?\.\'\,]+.                                             {   title_length = strlen(yytext+15);
                                                                                          title = (char *) malloc(sizeof(char) * strlen(yytext));
                                                                                          memset(title, '\0', title_length);
                                                                                          strncpy(title, yytext+15, title_length - 1);
                                                                                          printf("%s\n", title);
                                                                                          free(title);
                                                                                      }
ency\_imgTitle\<\/span\>\"\&gt\;\<\/span\>[ \t0-9A-Za-z\?\.\']+\<span                 {   title_length = strlen(yytext+32);
                                                                                          title = (char *) malloc(sizeof(char) * strlen(yytext));
                                                                                          memset(title, '\0', title_length);
                                                                                          strncpy(title, yytext+32, title_length - 1);
                                                                                          printf("%s\n", title);
                                                                                          free(title);
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
