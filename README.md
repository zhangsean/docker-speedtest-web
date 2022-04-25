# zhangsean/cloud189

基于 [`tickstep/cloudpan189-go`](https://github.com/tickstep/cloudpan189-go) 的天翼云盘命令行客户端容器镜像.

[![DockerHub Badge](http://dockeri.co/image/zhangsean/cloud189)](https://hub.docker.com/r/zhangsean/cloud189/)

## 环境变量

环境变量 | 默认值 | 描述
---|---|---
CLOUD189_USERNAME | | 用户名
CLOUD189_PASSWORD | | 密码
CLOUD189_VERBOSE | 0 | 是否输出接口调试日志
CLOUD189_SAVEDIR | /root/Downloads | 下载文件保存路径
CLOUD189_CACHE_SIZE| 256KB | 下载缓存
CLOUD189_PROXY | | 设置代理, 支持 http/socks5 代理，例如：http://127.0.0.1:8888

## 用法

本镜像已经将命令行 `cloudpan189-go` 软连接为 `cloud189`，两个命令等价，均可以使用。

```sh
# 环境变量自动登录，自动开始下载任务，下载完成后容器自动删除
docker run -it --rm \
    -e CLOUD189_USERNAME=189xxxxxxxx \
    -e CLOUD189_PASSWORD=xxxxxxxx \
    -e CLOUD189_SAVEDIR=/downloads \
    -v ~/Downloads:/downloads \
    zhangsean/cloud189 \
    d "游戏/xxxx"
# 友情提示：下载路径最好用双引号，避免因为文件或目录名有空格导致下载失败

# 一键自动签到
docker run -itd \
    --name cloud189-sign \
    -e CLOUD189_USERNAME=189xxxxxxxx \
    -e CLOUD189_PASSWORD=xxxxxxxx \
    zhangsean/cloud189 \
    sign
# 在任何系统设置定时任务，每天重启这个容器即可每天自动签到，以群辉为例
#minute	hour	mday	month	wday	who	command
0	0	*	*	*	root	docker restart cloud189-sign

# 环境变量自动登录，并进入交互模式
docker run -it \
    --name cloud189 \
    -e CLOUD189_USERNAME=189xxxxxxxx \
    -e CLOUD189_PASSWORD=xxxxxxxx \
    zhangsean/cloud189

# 纯手动命令行模式启动
docker run -it \
    --name cloud189 \
    zhangsean/cloud189 \
    sh

# 再次进入容器命令行
docker exec -it cloud189 sh

# 进入cloudpan189-go交互模式
cloud189
# 手动交互登录
>login
# 列举网盘文件
>ls
# 进入指定目录
>cd 游戏
# 其他命令请查看cloudpan189-go说明

# 使用完成后删除容器
docker rm -f cloud189
```
