FROM debian:latest

RUN apt-get -qq update \
    && apt-get install -y \
    gcc git wget make libncurses-dev \
    flex bison gperf python python-serial \
    cmake ninja-build \
    ccache \
    vim picocom curl \
    && apt-get clean

VOLUME /tmp
RUN cd /tmp/ && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python get-pip.py

RUN mkdir -p /esp
RUN wget -c https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz
RUN tar -xzf xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz
RUN rm xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz
RUN mv xtensa-esp32-elf /esp
ENV PATH $PATH:/esp/xtensa-esp32-elf/bin
ENV PATH $PATH:/root/.local/bin
ENV IDF_PATH /esp/esp-idf

RUN cd /esp && git clone -b release/v3.2 --recursive https://github.com/espressif/esp-idf.git
RUN cd /esp/esp-idf && python -m pip install --user -r requirements.txt
