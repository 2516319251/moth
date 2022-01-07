package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
	"time"

	"moth/internal/conf"
)

func main() {
	// 获取配置文件路径
	filepath := flag.String("c", "../conf/config.yaml", "config file path.")
	flag.Parse()

	// 获取配置信息
	c := conf.GetConfig(*filepath)

	// 调试 Dockerfile 中 VOLUME 的生效情况
	fmt.Println(c.S)

	// 执行方法
	http.HandleFunc("/", EchoTimeHandler)

	// 启动 http 服务
	log.Printf("【moth】服务启动成功，监听端口：%d", c.Port)
	if err := http.ListenAndServe(fmt.Sprintf("0.0.0.0:%d", c.Port), nil); err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}

// EchoTimeHandler 输出时间
func EchoTimeHandler(w http.ResponseWriter, r *http.Request)  {
	t := time.Now().String()
	log.Println(t)
	w.Write([]byte(t))
}
