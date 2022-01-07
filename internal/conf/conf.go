package conf

import (
	"io/ioutil"

	"gopkg.in/yaml.v2"
)

// Conf 配置信息结构体
type Conf struct {
	Port int    `yaml:"port"`
	S    string `yaml:"s"`
}

// GetConfig 获取配置信息
func GetConfig(filepath string) *Conf {
	// 读取文件信息
	f, e := ioutil.ReadFile(filepath)
	if e != nil {
		panic(e)
	}

	// 将配置信息映射到结构体
	c := new(Conf)
	if e = yaml.Unmarshal(f, c); e != nil {
		panic(e)
	}

	// 返回
	return c
}
