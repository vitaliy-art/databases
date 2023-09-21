package models

import (
	"fmt"
	"sample/fields"

	"github.com/beego/beego/v2/client/orm"
)

type Employee struct {
	Id       string
	Position fields.PositionField

	PersonId string
	Person   *Person `orm:"-"`

	DepartmentId int64
	Department   *Department `orm:"-"`
}

func (e *Employee) TableName() string {
	return "employees"
}

func (e *Employee) String() string {
	return fmt.Sprintf(
		"{ Employee: { Id: %s, Person: %s, Department: %s, Position: %s } }",
		e.Id,
		e.Person.String(),
		e.Department.String(),
		(&e.Position).String(),
	)
}

func (e *Employee) IdFieldName() string {
	return "id"
}

func (e *Employee) IdValue() any {
	return e.Id
}

func init() {
	orm.RegisterModel(&Employee{})
}
