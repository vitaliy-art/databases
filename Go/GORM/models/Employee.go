package models

import (
	"fmt"

	"github.com/google/uuid"
	"gorm.io/gorm"
)

type Employee struct {
	Id string `gorm:"primarykey"`

	PersonId string
	Person   Person

	DepartmentId uint
	Department   Department

	Position Position
}

func (Employee) TableName() string {
	return "employees"
}

func (e Employee) String() string {
	return fmt.Sprintf(
		"Employee { Id: %s, Person: %s, Department: %s, Position: %s }",
		e.Id,
		e.Person.String(),
		e.Department.String(),
		e.Position.String(),
	)
}

func (e *Employee) BeforeCreate(_ *gorm.DB) error {
	e.Id = uuid.NewString()
	return nil
}
