#!/usr/bin/env bash

mvn clean package

echo 'Copy files...'

scp -i ~/.ssh/id_rsa\
    target/sweater-1.0-SNAPSHOT.jar \
    lless@192.168.0.10:/home/lless/

echo 'Restart server...'

ssh -i ~/.ssh/id_rsa lless@192.168.0.10 << EOF
pgrep java | xargs kill -9
nohup java -jar sweater-1.0-SNAPSHOT.jar > log.txt &
EOF

echo 'Bye'