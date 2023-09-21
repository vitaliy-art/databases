package models

import (
	"fmt"

	"github.com/beego/beego/v2/client/orm"
)

type Department struct {
	Id   int64
	Name string
}

func (d *Department) TableName() string {
	return "departments"
}

func (d *Department) String() string {
	return fmt.Sprintf("{ Department: { Id: %d, Name: %s } }", d.Id, d.Name)
}

func (d *Department) IdFieldName() string {
	return "id"
}

func (d *Department) IdValue() any {
	return d.Id
}

func init() {
	orm.RegisterModel(&Department{})
}
