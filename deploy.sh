#!/bin/bash

#env=${1}

#rm -rf peacetrue-modules-app/src/main/resources/public
#cd peacetrue-modules-react-admin || exit
#yarn build
#mv ./build ../peacetrue-modules-app/src/main/resources/public
#cd ../

./gradlew clean
./gradlew bootJar

scp peacetrue-modules-app/build/libs/peacetrue-modules-app-1.0.0-SNAPSHOT.jar $ali_ssh:/root/peacetrue/peacetrue-modules-sample
scp peacetrue-modules-app/src/main/resources/application-template.yml $ali_ssh:/root/peacetrue/peacetrue-modules-sample

ssh $ali_ssh <<EOF
cd /root/peacetrue/peacetrue-modules-sample
mv application-template.yml application-default.yml
killbp 8112
nohup java -jar peacetrue-modules-app-1.0.0-SNAPSHOT.jar >/dev/null 2>&1  &
EOF

# scp $ali_ssh:/root/peacetrue/peacetrue-modules/02-output/template-0.pdf ./
# scp docs/antora/modules/ROOT/attachment/Fonts.zip $ali_ssh:/root/peacetrue/peacetrue-modules/
