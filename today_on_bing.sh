#/usr/bin/bash
./url2file "https://cn.bing.com/?ensearch=1" 2>/dev/null
./today_on_bing_url page.out > link.txt
python3 today_on_bing.py > bing.html
./today_on_bing bing.html
file_name=`./today_on_bing bing.html | head -n 1 | sed 's/ /\_/g'`'.txt'
./today_on_bing bing.html > $file_name
