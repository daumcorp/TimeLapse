for i in *.JPG; do scp $i ezhong@ezc:~/public_html/lapse/pics/original && rm -rf $i && curl -s http://ezc.dev.daum.net/h/lapse/uploaded.php?f=$i && sleep 3; done
