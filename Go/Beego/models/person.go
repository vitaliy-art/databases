package models

import (
	"fmt"
	"time"

	"github.com/beego/beego/v2/client/orm"
)

type Person struct {
	Id        string `orm:"pk"`
	Name      string
	Address   string
	BirthDate time.Time `orm:"type(date)"`
}

func (p *Person) TableName() string {
	return "people"
}

func (p *Person) String() string {
	return fmt.Sprintf(
		"{ Person: { Id: %s, Name: %s, Address: %s, BirthDate: %s } }",
		p.Id,
		p.Name,
		p.Address,
		p.BirthDate.Format(time.DateOnly),
	)
}

func (p *Person) IdFieldName() string {
	return "id"
}

func (p *Person) IdValue() any {
	return p.Id
}

func init() {
	orm.RegisterModel(&Person{})
}
