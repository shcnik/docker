#!/bin/sh
mysql -h db -u shcnik -pdisco_sovenok data -e 'CREATE OR REPLACE TABLE data ( id INT NOT NULL AUTO_INCREMENT, name TINYTEXT, age TINYINT, 
PRIMARY KEY (id) )'
skip_headers=1
while IFS=, read -r name age
do
    if ((skip_headers))
    then
        ((skip_headers--))
    else
        mysql -h db -u shcnik -u root -pdisco_sovenok data -e "INSERT INTO data (name, age) VALUES ('$name', '$age')"
    fi
done < contents/data.csv

