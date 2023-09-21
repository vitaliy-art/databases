package repository

import (
	"fmt"
	"sample/fields"
	"sample/models"
	"time"

	"github.com/beego/beego/v2/client/orm"
	"github.com/google/uuid"
)

var (
	_ Id = &models.Department{}
	_ Id = &models.Person{}
	_ Id = &models.Employee{}
)

type Repository struct {
	o orm.Ormer
}

func NewRepository(databaseAlias, databaseDriver, connectionString string) (*Repository, error) {
	orm.RegisterDataBase(databaseAlias, databaseDriver, connectionString)
	o := orm.NewOrm()
	if _, err := o.Raw("PRAGMA foreign_keys = ON;").Exec(); err != nil {
		return nil, err
	}

	return &Repository{o: o}, nil
}

func (r *Repository) AddDepartment(name string) (dep *models.Department, err error) {
	dep = &models.Department{Name: name}
	dep.Id, err = r.o.Insert(dep)
	return
}

func (r *Repository) AddPerson(name, address string, birthDate time.Time) (per *models.Person, err error) {
	per = &models.Person{Id: uuid.NewString(), Name: name, Address: address, BirthDate: birthDate}
	_, err = r.o.Insert(per)
	return
}

func (r *Repository) AddEmployee(person *models.Person, department *models.Department, position fields.PositionField) (emp *models.Employee, err error) {
	emp = &models.Employee{Id: uuid.NewString(), DepartmentId: department.Id, Department: department, PersonId: person.Id, Person: person, Position: position}
	_, err = r.o.Insert(emp)
	return
}

func (r *Repository) AddEmployeeWithPerson(
	department *models.Department,
	name, address string,
	birthDate time.Time,
	position fields.PositionField,
) (emp *models.Employee, err error) {
	var per *models.Person
	per, err = r.AddPerson(name, address, birthDate)
	if err != nil {
		return
	}

	return r.AddEmployee(per, department, position)
}

func (r *Repository) Update(obj any) (err error) {
	_, err = r.o.Update(obj)
	return
}

func (r *Repository) GetAllDepartments() (departments []*models.Department, err error) {
	_, err = r.o.QueryTable(&models.Department{}).All(&departments)
	return
}

func (r *Repository) GetAllPeople() (people []*models.Person, err error) {
	_, err = r.o.QueryTable(&models.Person{}).All(&people)
	return
}

func (r *Repository) GetAllEmployees() (employees []*models.Employee, err error) {
	if _, err = r.o.QueryTable(&models.Employee{}).All(&employees); err != nil {
		return
	}

	var (
		departments    []*models.Department
		departmentsMap = map[int64]*models.Department{}
		people         []*models.Person
		peopleMap      = map[string]*models.Person{}
	)

	if departments, err = r.GetAllDepartments(); err != nil {
		return
	}

	if people, err = r.GetAllPeople(); err != nil {
		return
	}

	for _, dep := range departments {
		departmentsMap[dep.Id] = dep
	}

	for _, per := range people {
		peopleMap[per.Id] = per
	}

	for _, emp := range employees {
		emp.Department = departmentsMap[emp.DepartmentId]
		emp.Person = peopleMap[emp.PersonId]
	}

	return
}

type Id interface {
	IdFieldName() string
	IdValue() any
}

func (r *Repository) Delete(obj Id, table any) error {
	_, err := r.o.QueryTable(table).Filter(obj.IdFieldName(), obj.IdValue()).Delete()
	return err
}

func (r *Repository) DeleteMany(objects []Id, table any) error {
	if len(objects) == 0 {
		return nil
	}

	ids := []any{}
	for _, obj := range objects {
		ids = append(ids, obj.IdValue())
	}

	_, err := r.o.QueryTable(table).Filter(fmt.Sprintf("%s__in", objects[0].IdFieldName()), ids...).Delete()
	return err
}
