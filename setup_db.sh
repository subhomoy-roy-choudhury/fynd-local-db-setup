#!/bin/bash

db_names=("orbis" "silverbolt");

echo "[1] orbis";
echo "[2] silverbolt";

read -p 'Enter the option :- ' option_key;

function get_db() {
    echo ${mongo localhost:27017 --eval 'db.getMongo().getDBNames().indexOf("${1}")'};
    wget --no-check-certificate https://raw.githubusercontent.com/subhomoy-roy-choudhury/fynd-local-db-setup/master/db_zip/${1}.zip\?token\=GHSAT0AAAAAABXP2LPFFINS4OWZHHPZE36WYXTNW5Q -O ${1}.zip
    unzip ${1}.zip
    mongorestore --db ${1} --gzip ${1}
}

get_db ${db_names[$option_key - 1]};