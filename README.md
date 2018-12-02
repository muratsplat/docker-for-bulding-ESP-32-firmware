[![Build Status](https://travis-ci.com/muratsplat/docker-for-bulding-ESP-32-firmware.svg?branch=master)](https://travis-ci.com/muratsplat/docker-for-bulding-ESP-32-firmware)

# docker-for-bulding-esp-32-firmware 

This is Dockerfile. it will be used to build the firmware of ESP-32 with security certificate..


## How to use 

Firt of all you need a docker file inherided this docker image

```dockerfile
FROM muod/esp32-sdk:latest

COPY src /project/src
COPY build.sh /project/src
RUN cd /project/src && chmod +x build.sh

WORKDIR  /project/src

CMD [ "bash", "./build.sh"]
```

## How to build new docker image over on `docker-for-bulding-esp-32-firmware`

```sh
$ docker build -t esp32:latest .

Sending build context to Docker daemon  89.08MB
Step 1/6 : FROM muod/esp32-sdk:latest
latest: Pulling from muod/esp32-sdk
54f7e8ac135a: Pull complete
9c907476ebb5: Downloading  35.76MB/147.5MB
4a8793b25082: Download complete
247872f05cc2: Download complete
ceb9a8e12f8b: Download complete
31c20b15f509: Download complete
cd46869bd3dd: Download complete
3c110fc160fc: Downloading  22.54MB/45.03MB
3d32d159f624: Downloading  9.571MB/306.7MB

....

```


# TODO:
