# presto-cluster-docker

利用docker容器模拟presto集群的部署。

使用步骤：
1. 在项目根目录下放置presto-server的部署包，一般情况下，官方包名为 presto-server-xxx.tar.gz, 其中xxx为版本号
2. 运行脚本build.sh，构建一个名为presto的镜像，此处要记得修改build.sh中PRESTO_SERVER_PACKAGE变量的值为自己下载的安装包名（去除后缀）；
3. 根据需要修改 coordinator-etc目录 和 worker-etc目录 下的配置文件
4. 使用命令`docker-compose up`启动presto容器集群

接下来开始愉快的presto之旅吧！:smirk:
