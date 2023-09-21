package main

import (
	"fmt"
	"sample/fields"
	"sample/models"
	"sample/repository"
	"time"

	_ "github.com/mattn/go-sqlite3"
)

func main() {
	r, err := repository.NewRepository("default", "sqlite3", "bd.db")
	if err != nil {
		panic(err)
	}

	fmt.Print("Clean up database... ")
	departments, err := r.GetAllDepartments()
	if err != nil {
		panic(err)
	}
	if err = r.DeleteMany(
		forEach(departments, func(d *models.Department) repository.Id { return d }),
		&models.Department{},
	); err != nil {
		panic(err)
	}
	people, err := r.GetAllPeople()
	if err != nil {
		panic(err)
	}
	if err = r.DeleteMany(
		forEach(people, func(p *models.Person) repository.Id { return p }),
		&models.Person{},
	); err != nil {
		panic(err)
	}
	employees, err := r.GetAllEmployees()
	if err != nil {
		panic(err)
	}
	if err = r.DeleteMany(
		forEach(employees, func(e *models.Employee) repository.Id { return e }),
		&models.Employee{},
	); err != nil {
		panic(err)
	}
	fmt.Println("done")
	fmt.Println()

	fmt.Print("Add departments... ")
	dep1, err := r.AddDepartment("Department One")
	if err != nil {
		panic(err)
	}
	dep2, err := r.AddDepartment("Department Two")
	if err != nil {
		panic(err)
	}
	fmt.Println("done")
	fmt.Println()

	fmt.Println("Added departments:")
	if departments, err = r.GetAllDepartments(); err != nil {
		panic(err)
	}
	for _, dep := range departments {
		fmt.Println(dep)
	}
	fmt.Println()

	fmt.Print("Add people... ")
	per1, err := r.AddPerson("Ivan", "Moscow", time.Date(1990, time.October, 02, 0, 0, 0, 0, time.Local))
	if err != nil {
		panic(err)
	}
	per2, err := r.AddPerson("John", "London", time.Date(1998, time.January, 14, 0, 0, 0, 0, time.Local))
	if err != nil {
		panic(err)
	}
	fmt.Println("done")
	fmt.Println()

	fmt.Println("Added people:")
	if people, err = r.GetAllPeople(); err != nil {
		panic(err)
	}
	for _, per := range people {
		fmt.Println(per)
	}
	fmt.Println()

	fmt.Print("Add employees... ")
	if _, err = r.AddEmployee(per1, dep1, fields.Staffer); err != nil {
		panic(err)
	}
	if _, err = r.AddEmployee(per2, dep1, fields.Staffer); err != nil {
		panic(err)
	}
	if _, err = r.AddEmployeeWithPerson(dep2, "Nick", "Berlin", time.Date(1995, time.February, 23, 0, 0, 0, 0, time.Local), fields.Manager); err != nil {
		panic(err)
	}
	if _, err = r.AddEmployeeWithPerson(dep2, "Stan", "Oslo", time.Date(1988, time.April, 21, 0, 0, 0, 0, time.Local), fields.Boss); err != nil {
		panic(err)
	}
	fmt.Println("done")
	fmt.Println()

	fmt.Println("Added employees:")
	if employees, err = r.GetAllEmployees(); err != nil {
		panic(err)
	}
	for _, emp := range employees {
		fmt.Println(emp)
	}
	fmt.Println()

	fmt.Print("Delete Department One... ")
	if err = r.Delete(dep1, dep1); err != nil {
		panic(err)
	}
	fmt.Println("done")
	fmt.Println()

	fmt.Print("Update Department Two... ")
	dep2.Name = "Department"
	if err = r.Update(dep2); err != nil {
		panic(err)
	}
	fmt.Println("done")
	fmt.Println()

	fmt.Print("Update Ivan... ")
	per1.Address = "Tula"
	if err = r.Update(per1); err != nil {
		panic(err)
	}
	fmt.Println("done")
	fmt.Println()

	fmt.Println("Remain departments:")
	if departments, err = r.GetAllDepartments(); err != nil {
		panic(err)
	}
	for _, dep := range departments {
		fmt.Println(dep)
	}
	fmt.Println()

	fmt.Println("Remain people:")
	if people, err = r.GetAllPeople(); err != nil {
		panic(err)
	}
	for _, per := range people {
		fmt.Println(per)
	}
	fmt.Println()

	fmt.Println("Remain employees:")
	if employees, err = r.GetAllEmployees(); err != nil {
		panic(err)
	}
	for _, emp := range employees {
		fmt.Println(emp)
	}
	fmt.Println()

	fmt.Print("Delete Department Two... ")
	if err = r.Delete(dep2, dep1); err != nil {
		panic(err)
	}
	fmt.Println("done")
	fmt.Println()

	fmt.Print("Remain departments count: ")
	if departments, err = r.GetAllDepartments(); err != nil {
		panic(err)
	}
	fmt.Println(len(departments))
	fmt.Println()

	fmt.Print("Remain people count: ")
	if people, err = r.GetAllPeople(); err != nil {
		panic(err)
	}
	fmt.Println(len(people))
	fmt.Println()

	fmt.Print("Remain employees count: ")
	if employees, err = r.GetAllEmployees(); err != nil {
		panic(err)
	}
	fmt.Println(len(employees))
	fmt.Println()

	fmt.Print("Delete people... ")
	if err = r.DeleteMany(
		forEach(people, func(p *models.Person) repository.Id { return p }),
		&models.Person{},
	); err != nil {
		panic(err)
	}
	fmt.Println("done")
	fmt.Println()

	fmt.Print("Remain people count: ")
	if people, err = r.GetAllPeople(); err != nil {
		panic(err)
	}
	fmt.Println(len(people))
}

func forEach[T any, E any](slice []T, predicate func(T) E) []E {
	newSlice := []E{}
	for i := 0; i < len(slice); i++ {
		newSlice = append(newSlice, predicate(slice[i]))
	}
	return newSlice
}
