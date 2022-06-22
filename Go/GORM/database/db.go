package database

import (
	"gorm/models"

	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
)

type DbFactory interface {
	GetDB() *gorm.DB
}

type SqliteFactory struct {
	db *gorm.DB
}

func NewSqliteFactory(filename string) (f *SqliteFactory, err error) {
	db, err := gorm.Open(sqlite.Open(filename), &gorm.Config{})
	if err != nil {
		return
	}

	sql := "PRAGMA foreign_keys = ON;"
	db.Exec(sql)

	migrationModels := []interface{}{
		&models.Department{},
		&models.Person{},
		&models.Employee{},
	}

	db.Exec(sql)

	err = db.Debug().AutoMigrate(migrationModels...)
	if err != nil {
		return
	}

	f = &SqliteFactory{db: db}
	return
}

func (f SqliteFactory) GetDB() *gorm.DB {
	return f.db
}
