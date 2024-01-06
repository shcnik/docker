#!/bin/sh
mysql -h db -u $3 -p$4 $1 -e "CREATE OR REPLACE TABLE $2 ( id INT NOT NULL AUTO_INCREMENT, name TINYTEXT, age TINYINT, PRIMARY KEY (id) )"
skip_headers=1
while IFS=, read -r name age
do
    if ((skip_headers))
    then
        ((skip_headers--))
    else
        mysql -h db -u $3 -p$4 $1 -e "INSERT INTO $2 (name, age) VALUES ('$name', '$age')"
    fi
done < contents/data.csv

