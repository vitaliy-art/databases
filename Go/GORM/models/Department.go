package models

import (
	"fmt"
)

type Department struct {
	ID        uint `gorm:"primarykey"`
	Name      string
	Employees []Employee `gorm:"constraint:OnDelete:CASCADE;"`
}

func (Department) TableName() string {
	return "departments"
}

func (d Department) String() string {
	return fmt.Sprintf("Department { Id: %d, Name: %s }", d.ID, d.Name)
}
