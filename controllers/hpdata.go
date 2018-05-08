package controllers

import (
	"strings"
	"../models"
	"github.com/astaxie/beego"
)

type HpdataController struct {
	BaseController
}

func (self *HpdataController) Index()  {
	self.Data["pageTitle"]="原始数据"

	self.display()
}

func (self *HpdataController) Table() {
	//列表
	page, err := self.GetInt("page")
	if err != nil {
		page = 1
	}
	limit, err := self.GetInt("limit")
	if err != nil {
		limit = 30
	}

	realName := strings.TrimSpace(self.GetString("duser"))

	StatusText := make(map[int]string)
	StatusText[0] = "<font color='red'>禁用</font>"
	StatusText[1] = "正常"

	self.pageSize = limit
	//查询条件
	filters := make([]interface{}, 0)
	//
	if realName != "" {
		filters = append(filters, "duser__icontains", realName)
	}
	result, count := models.Hp_dataGetList(page, self.pageSize, filters...)
	list := make([]map[string]interface{}, len(result))
	for k, v := range result {
		row := make(map[string]interface{})
		row["Id"] = v.Id
		row["Duser"] = v.Duser
		row["Ddata"] = v.Ddata
		row["Dsatus"]=v.Dsatus
		row["Dkey"]=v.Dkey
		row["Dtime"] = beego.Date(v.Dtime, "Y-m-d H:i:s")
		row["Dstime"] = beego.Date(v.Dstime, "Y-m-d H:i:s")
		list[k] = row
	}
	self.ajaxList("成功", MSG_OK, count, list)
}
