# elm-docker
 饿了么工具docker
 
一键安装：
```shell
bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/zelang/elm-docker/main/elmtool.sh')
```

手动安装：
```shell
mkdir -p /etc/elmtool && chmod +x /etc/elmtool && cd /etc/elmtool
wget https://raw.githubusercontent.com/zelang/elm-docker/main/docker-compose.yml -O /etc/elmtool/docker-compose.yml
wget https://raw.githubusercontent.com/zelang/elm-docker/main/config.yaml -O /etc/elmtool/config.yaml
docker-compose pull
docker-compose up -d --force-recreate
```

使用说明：

1. 手动安装需要预装docker和docker-compose环境
2. 使用一键脚本安装或者手动安装后，需要先执行 `docker stop elmtool` 停止docker运行
3. 然后修改`/etc/elmtool/config.yaml`配置文件
4. 再执行命令：`cd /etc/elmtool && docker start elmtool`