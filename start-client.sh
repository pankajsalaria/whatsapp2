#!/bin/bash
filename="stop-client.csv"
WA_VERSION="2.45.2"
(cat "$filename"; echo "") |
while read line;
do
    wabiz_directory=`echo $line | awk -F',' '{print $1}'`
    cd "/root/$wabiz_directory"
    WA_API_VERSION=$WA_VERSION docker-compose -f docker-compose.yml --compatibility up -d
            break
done

