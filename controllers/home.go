/**********************************************
** @Des: This file ...
** @Author: haodaquan
** @Date:   2017-09-08 10:21:13
** @Last Modified by:   haodaquan
** @Last Modified time: 2017-09-09 18:04:41
***********************************************/
package controllers

import "fmt"

type HomeController struct {
	BaseController
}

func (self *HomeController) Index() {
	fmt.Println("Index")
	self.Data["pageTitle"] = "系统首页"
	//self.display()
	self.TplName = "public/main.html"
}

func (self *HomeController) Start() {
	fmt.Println("1111111111111")
	self.Data["pageTitle"] = "控制面板"
	self.display()
}
