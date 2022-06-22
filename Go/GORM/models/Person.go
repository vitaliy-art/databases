package models

import (
	"fmt"
	"time"

	"github.com/google/uuid"
	"gorm.io/gorm"
)

type Person struct {
	Id        string `gorm:"primarykey"`
	Name      string
	Address   string
	BirthDate time.Time
	Employees []Employee `gorm:"constraint:OnDelete:CASCADE;"`
}

func (Person) TableName() string {
	return "people"
}

func (p Person) String() string {
	return fmt.Sprintf(
		"Person { Id: %s, Name: %s, Address: %s, BirthDate: %s }",
		p.Id,
		p.Name,
		p.Address,
		p.BirthDate.Format("02.01.2006"),
	)
}

func (p *Person) BeforeCreate(_ *gorm.DB) error {
	p.Id = uuid.NewString()
	return nil
}
