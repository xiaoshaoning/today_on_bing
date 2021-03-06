url2file: url2file.c
	gcc -o url2file url2file.c -lcurl
today_on_bing : today_on_bing.l
	flex -o today_on_bing.lex.yy.c today_on_bing.l
	gcc -o today_on_bing today_on_bing.lex.yy.c -lfl
today_on_bing_url : today_on_bing_url.l
	flex -o today_on_bing_url.lex.yy.c today_on_bing_url.l
	gcc -o today_on_bing_url today_on_bing_url.lex.yy.c -lfl
br2return : br2return.l
	flex -o br2return.lex.yy.c br2return.l
	gcc -o br2return br2return.lex.yy.c -lfl
test:
	./url2file "https://cn.bing.com/?ensearch=1" 2>/dev/null
	./today_on_bing_url page.out > link.txt
	python3 today_on_bing.py  > bing.html
	./today_on_bing bing.html | ./br2return
	./save_file.sh
