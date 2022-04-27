# zhangsean/speedtest-web

Web based network speed test server, powered by [`librespeed/speedtest-go`](https://github.com/librespeed/speedtest-go).

[![Github Release](https://img.shields.io/github/v/release/zhangsean/docker-speedtest-web)](https://github.com/zhangsean/docker-speedtest-web)

[![DockerHub Badge](https://dockeri.co/image/zhangsean/speedtest-web)](https://hub.docker.com/r/zhangsean/speedtest-web/)

## Usage

```sh
docker run -itd --name speedtest-web \
    -p 666:8989 \
    zhangsean/speedtest-web
```
