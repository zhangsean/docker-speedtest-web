FROM alpine
LABEL MAINTAINER="zhangsean <zxf2342@qq.com>"

ENV SPEEDTEST_GO_VER=v1.1.5

EXPOSE 8989

RUN wget -O speedtest.tar.gz https://github.com/librespeed/speedtest-go/releases/download/${SPEEDTEST_GO_VER}/speedtest-go_${SPEEDTEST_GO_VER:1}_linux_amd64.tar.gz && \
    tar zxf speedtest.tar.gz && \
    rm -f speedtest.tar.gz

CMD /speedtest-backend
