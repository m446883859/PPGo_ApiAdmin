package models

import (
	"time"
	"github.com/astaxie/beego/orm"
)

type Hp_data struct {
	Id           int
	Duser         string
	Ddata         string
	Dtime    time.Time
	Dsatus int
	Dstime         time.Time
	Dkey string
}
func (a *Hp_data) TableName() string {
	return "hp_data"
}

func Hp_dataGetList(page, pageSize int, filters ...interface{}) ([]*Hp_data, int64) {
	offset := (page - 1) * pageSize
	list := make([]*Hp_data, 0)
	query := orm.NewOrm().QueryTable(new(Hp_data).TableName())
	if len(filters) > 0 {
		l := len(filters)
		for k := 0; k < l; k += 2 {
			query = query.Filter(filters[k].(string), filters[k+1])
		}
	}
	total, _ := query.Count()
	query.OrderBy("-id").Limit(pageSize, offset).All(&list)
	return list, total
}


