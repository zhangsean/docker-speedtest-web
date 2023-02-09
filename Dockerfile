FROM alpine
LABEL MAINTAINER="zhangsean <zxf2342@qq.com>"

ENV SPEEDTEST_GO_VER=v1.1.5

EXPOSE 8989

WORKDIR /speedtest

RUN wget -O speedtest.tar.gz https://github.com/librespeed/speedtest-go/releases/download/${SPEEDTEST_GO_VER}/speedtest-go_${SPEEDTEST_GO_VER:1}_linux_amd64.tar.gz && \
    tar zxf speedtest.tar.gz && \
    rm -f speedtest.tar.gz && \
    sed -i '/assets_path/s/""/"."/' settings.toml && \
    wget https://github.com/librespeed/speedtest-go/raw/v1.1.4/web/assets/index.html && \
    wget https://github.com/librespeed/speedtest-go/raw/${SPEEDTEST_GO_VER}/web/assets/speedtest.js && \
    wget https://github.com/librespeed/speedtest-go/raw/${SPEEDTEST_GO_VER}/web/assets/speedtest_worker.js

CMD ./speedtest-backend
