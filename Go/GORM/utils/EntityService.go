package utils

import (
	"gorm/database"
	"gorm/models"
	"time"
)

type EntityService struct {
	dbFactory database.DbFactory
}

type EntityError string

func (e EntityError) Error() string {
	return string(e)
}

const EntryIsNullError EntityError = "entry cannot be null"

func NewEntityService(dbFactory database.DbFactory) EntityService {
	return EntityService{dbFactory: dbFactory}
}

func (s EntityService) get(entry interface{}, filter interface{}) error {
	if entry == nil {
		return EntryIsNullError
	}

	db := s.dbFactory.GetDB()
	return db.First(entry, filter).Error
}

func (s EntityService) GetDepartment(id uint) (dep *models.Department, err error) {
	dep = &models.Department{}
	filter := &models.Department{ID: id}
	err = s.get(dep, filter)
	return
}

func (s EntityService) GetPerson(id string) (per *models.Person, err error) {
	per = &models.Person{}
	filter := &models.Person{Id: id}
	err = s.get(per, filter)
	return
}

func (s EntityService) GetEmployee(id string) (emp *models.Employee, err error) {
	emp = &models.Employee{}
	filter := &models.Employee{Id: id}
	db := s.dbFactory.GetDB()
	err = db.Joins("Department").Joins("Person").First(emp, filter).Error
	return
}

func (s EntityService) addNew(entry interface{}) error {
	if entry == nil {
		return EntryIsNullError
	}

	db := s.dbFactory.GetDB()
	return db.Create(entry).Error
}

func (s EntityService) AddNewDepartment(name string) (dep *models.Department, err error) {
	dep = &models.Department{Name: name}
	err = s.addNew(dep)
	return
}

func (s EntityService) AddNewPerson(name, address string, birthDate time.Time) (per *models.Person, err error) {
	per = &models.Person{Name: name, Address: address, BirthDate: birthDate}
	err = s.addNew(per)
	return
}

func (s EntityService) AddNewEmployee(personId string, departmentId uint, position models.Position) (emp *models.Employee, err error) {
	per, err := s.GetPerson(personId)
	if err != nil {
		return
	}

	dep, err := s.GetDepartment(departmentId)
	if err != nil {
		return
	}

	tEmp := &models.Employee{PersonId: personId, DepartmentId: departmentId, Position: position}
	err = s.addNew(tEmp)
	if err != nil {
		return
	}

	emp = &models.Employee{
		Id:           tEmp.Id,
		PersonId:     personId,
		Person:       *per,
		DepartmentId: departmentId,
		Department:   *dep,
		Position:     position,
	}

	return
}

func (s EntityService) AddNewEmployeeAndPerson(departmentId uint, name, address string, birthDate time.Time, position models.Position) (emp *models.Employee, err error) {
	dep, err := s.GetDepartment(departmentId)
	if err != nil {
		return
	}

	per, err := s.AddNewPerson(name, address, birthDate)
	if err != nil {
		return
	}

	emp, err = s.AddNewEmployee(per.Id, dep.ID, position)
	return
}

func (s EntityService) Update(entry interface{}) error {
	if entry == nil {
		return EntryIsNullError
	}

	db := s.dbFactory.GetDB()
	return db.Save(entry).Error
}

func (s EntityService) GetAll(entries interface{}) error {
	if entries == nil {
		return EntryIsNullError
	}

	db := s.dbFactory.GetDB()
	return db.Find(entries).Error
}

func (s EntityService) Remove(entry interface{}) error {
	if entry == nil {
		return EntryIsNullError
	}

	db := s.dbFactory.GetDB()
	return db.Delete(entry).Error
}

func (s EntityService) RemoveRange(entries interface{}, ids []interface{}) error {
	if entries == nil {
		return EntryIsNullError
	}

	db := s.dbFactory.GetDB()
	return db.Delete(entries, ids).Error
}
