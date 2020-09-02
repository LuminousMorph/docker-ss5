# Docker-SS5(SS5-Docker)

*此镜像为SS5的Docker版本。采用 SS5-3.8.9-8 和 Centos7 封装，集成GPL协议*

*Github为项目镜像地址源地址为: https://gitlab.ice-luminous.com/heavenark/docker-socket5*

*项目镜像地址 https://harbor.ice-luminous.com/harbor/tags/3/heavenarks%2Fdocker-ss5*

## 简单启动

``` shell
  docker run -d -it harbor.ice-luminous.com/heavenarks/docker-ss5:[VERSION]
```

## 推荐启动脚本

``` shell
  docker run \
  -e S5_USER=[USER] \
  -e S5_PASSWORD=[PASSWORD] \
  -p [PORT]:1080 \
  --name=[CONTAINER NAME] \
  harbor.ice-luminous.com/heavenarks/docker-ss5:[VERSION]
```

## ENVIRONMENT

S5_USER -> Socket登陆账号

S5_PASSWORD -> Socket登陆密码

## PORT

默认暴露端口1080

## CONFIG

配置文件统一在/etc/opt/ss5/目录下
