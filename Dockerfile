FROM alpine
LABEL MAINTAINER="ZhangSean <zxf2342@qq.com>"

COPY entrypoint.sh /bin/entrypoint.sh

ENV CLOUD189_USERNAME= \
    CLOUD189_PASSWORD= \
    CLOUD189_CACHE_SIZE=256KB \
    CLOUD189_PROXY= \
    CLOUD189_SAVEDIR=/root/Downloads \
    CLOUD189_VERBOSE=0 \
    CLOUD189_VER=v0.1.1

RUN wget -O cloudpan189.zip https://github.com/tickstep/cloudpan189-go/releases/download/${CLOUD189_VER}/cloudpan189-go-${CLOUD189_VER}-linux-amd64.zip && \
    unzip cloudpan189.zip && \
    mv cloudpan189-go-*-linux-amd64/cloudpan189-go /bin/ && \
    rm -rf cloudpan189* && \
    ln -s /bin/cloudpan189-go /bin/cloud189

VOLUME [ "/root/Downloads" ]

ENTRYPOINT [ "/bin/entrypoint.sh" ]
