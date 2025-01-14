#!/bin/bash
regex="https:\\/\\/([a-z]+)\\.stackexchange\\.com\\/"
while read line; do
  if [[ $line =~ $regex ]]
  then
    site="${BASH_REMATCH[0]}"
    name="${BASH_REMATCH[1]}"
    curl "${site}content/Sites/$name/img/captcha.png" -o "$name.captcha.png"
    curl "https://cdn.sstatic.net/Sites/$name/img/captcha.jpg" -o "$name.captcha.jpg"
  fi
done < ~/Dropbox/stack-exchange-sites.txt