CSI=$($echo -e "\033[")
CEND="${CSI}0m"
CYELLOW="${CSI}1;33m"

OUT_ALERT() {
    echo -e "${CYELLOW} $1 ${CEND}"
}

DOCKER_INSTALL() {
    docker_exists=$(docker version 2>/dev/null)
    if [[ ${docker_exists} == "" ]]; then
        OUT_ALERT "[✓] 正在安装docker"

        curl -fsSL get.docker.com | bash 
    fi

    docker_compose_exists=$(docker-compose version 2>/dev/null)
    if [[ ${docker_compose_exists} == "" ]]; then
        OUT_ALERT "[✓] 正在安装docker-compose"

        curl -L --fail https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
        chmod +x /usr/local/bin/docker-compose && \
	    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
    fi
}

# SYNC_TIME() {
    # OUT_ALERT "[✓] 同步时间中"

    # timedatectl set-timezone Asia/Shanghai
    # ntpdate pool.ntp.org || htpdate -s www.baidu.com
    # hwclock -w
# }

DOCKER_UP() {
    chmod +x /etc/elmtool
    cd /etc/elmtool

    if [ ! -f "/etc/elmtool/docker-compose.yml" ]; then
        wget https://raw.githubusercontent.com/zelang/elm-docker/main/docker-compose.yml -O /etc/elmtool/docker-compose.yml
    fi
    
    if [[ $1 == "" ]]; then
        wget https://raw.githubusercontent.com/zelang/elm-docker/main/config.yaml -O /etc/elmtool/config.yaml
    else
        wget $1 -O /etc/elmtool/config.yaml
    fi

    docker-compose pull
    docker-compose up -d --force-recreate
}

echo -e "欢迎使用饿了么Tool Docker一键部署脚本"
read -p "输入Y/y确认安装 跳过安装请直接回车:  " CONFIRM
CONFIRM=${CONFIRM:-"N"}
if [[ ${CONFIRM} == "Y" || ${CONFIRM} == "y" ]];then
	if [ ! -d "/etc/elmtool" ]; then
		mkdir /etc/elmtool
	fi
	DOCKER_INSTALL
	DOCKER_UP
fi
exit 0