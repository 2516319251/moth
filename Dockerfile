FROM golang:1.16 as build

# 将代码复制进入镜像
COPY . /moth

# 编译
RUN cd /moth && make

# 指定基础镜像
FROM alpine:3.12

# 从上一步的 build 中添加编译后的程序文件
COPY --from=build  /moth/dist /www/moth/

# 指定工作目录
WORKDIR /www/moth/

# 声明暴露的端口，配置文件中的 port 有改动这里也需要跟着改
EXPOSE 80

# 添加 www 账号
RUN adduser -D -H www

# 指定运行账号
USER www

# 定义匿名数据卷。在启动容器时忘记挂载数据卷，会自动挂载到匿名卷。
VOLUME ["/www/moth/conf"]

## 制定程序入口
#ENTRYPOINT ["/www/moth/bin/main", "-c"]
#
## 为 ENTRYPOINT 指令指定的程序提供默认参数
#CMD ["/www/moth/conf/config.yaml"]

# 制定程序入口
CMD ["/www/moth/bin/main", "-c", "/www/moth/conf/config.yaml"]
