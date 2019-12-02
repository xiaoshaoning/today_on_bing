file_name=`./today_on_bing bing.html | head -n 1 | sed 's/ /\_/g'`'.txt'
./today_on_bing bing.html | ./br2return > $file_name
