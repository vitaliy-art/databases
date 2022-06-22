package main

import (
	"fmt"
	"gorm/database"
	"gorm/models"
	"gorm/utils"
	"strings"
	"time"
)

func main() {
	f, err := database.NewSqliteFactory("bd.db")
	if err != nil {
		panic(err.Error())
	}

	s := utils.NewEntityService(f)

	fmt.Print("Clean up database... ")

	departments := []models.Department{}
	persons := []models.Person{}
	employees := []models.Employee{}

	if err = s.GetAll(&departments); err != nil {
		panic(err.Error())
	} else if len(departments) > 0 {
		ids := []interface{}{}
		for _, dep := range departments {
			ids = append(ids, dep.ID)
		}

		if err = s.RemoveRange(&departments, ids); err != nil {
			panic(err.Error())
		}
	}

	if err = s.GetAll(&persons); err != nil {
		panic(err.Error())
	} else if len(persons) > 0 {
		ids := []interface{}{}
		for _, per := range persons {
			ids = append(ids, per.Id)
		}

		if err = s.RemoveRange(&persons, ids); err != nil {
			panic(err.Error())
		}
	}

	if err = s.GetAll(&employees); err != nil {
		panic(err.Error())
	} else if len(employees) > 0 {
		ids := []interface{}{}
		for _, emp := range employees {
			ids = append(ids, emp.Id)
		}

		if err = s.RemoveRange(&employees, ids); err != nil {
			panic(err.Error())
		}
	}

	fmt.Println("done")

	fmt.Print("\nAdd departments... ")

	dep1, err := s.AddNewDepartment("Department One")
	if err != nil {
		panic(err.Error())
	}

	dep2, err := s.AddNewDepartment("Department Two")
	if err != nil {
		panic(err.Error())
	}

	fmt.Println("done")

	fmt.Println("\nAdded departments:")

	if err = s.GetAll(&departments); err != nil {
		panic(err.Error())
	} else {
		for _, dep := range departments {
			fmt.Println(strings.Repeat(" ", 4) + dep.String())
		}
	}

	fmt.Print("\nAdd persons... ")

	per1, err := s.AddNewPerson("Ivan", "Moscow", time.Date(1990, time.October, 02, 00, 00, 00, 00, time.UTC))
	if err != nil {
		panic(err.Error())
	}

	per2, err := s.AddNewPerson("John", "London", time.Date(1998, time.January, 14, 00, 00, 00, 00, time.UTC))
	if err != nil {
		panic(err.Error())
	}

	fmt.Println("done")

	fmt.Println("\nAdded persons:")

	if err = s.GetAll(&persons); err != nil {
		panic(err.Error())
	} else {
		for _, per := range persons {
			fmt.Println(strings.Repeat(" ", 4) + per.String())
		}
	}

	fmt.Print("\nAdd employees... ")

	if _, err = s.AddNewEmployee(per1.Id, dep1.ID, models.Staffer); err != nil {
		panic(err.Error())
	}

	if _, err = s.AddNewEmployee(per2.Id, dep1.ID, models.Staffer); err != nil {
		panic(err.Error())
	}

	if _, err = s.AddNewEmployeeAndPerson(dep2.ID, "Nick", "Berlin", time.Date(1995, time.February, 23, 00, 00, 00, 00, time.UTC), models.Manager); err != nil {
		panic(err.Error())
	}

	if _, err := s.AddNewEmployeeAndPerson(dep2.ID, "Stan", "Oslo", time.Date(1988, time.April, 21, 00, 00, 00, 00, time.UTC), models.Boss); err != nil {
		panic(err.Error())
	}

	fmt.Println("done")

	fmt.Println("\nAdded employees:")

	if err = s.GetAll(&employees); err != nil {
		panic(err.Error())
	} else {
		fEmployees := []*models.Employee{}
		for _, emp := range employees {
			if fEmp, err := s.GetEmployee(emp.Id); err != nil {
				panic(err.Error())
			} else {
				fEmployees = append(fEmployees, fEmp)
			}
		}

		for _, emp := range fEmployees {
			fmt.Println(strings.Repeat(" ", 4) + emp.String())
		}
	}

	fmt.Print("\nDelete Department One... ")

	if err = s.Remove(dep1); err != nil {
		panic(err.Error())
	}

	fmt.Println("done")

	fmt.Print("\nUpdate Department Two... ")
	dep2.Name = "Department"

	if err = s.Update(dep2); err != nil {
		panic(err.Error())
	}

	fmt.Println("done")

	fmt.Print("\nUpdate Ivan... ")
	per1.Address = "Tula"

	if err = s.Update(per1); err != nil {
		panic(err.Error())
	}

	fmt.Println("done")

	fmt.Println("\nRemain departments:")

	if err = s.GetAll(&departments); err != nil {
		panic(err.Error())
	} else {
		for _, dep := range departments {
			fmt.Println(strings.Repeat(" ", 4) + dep.String())
		}
	}

	fmt.Println("\nRemain persons:")

	if err = s.GetAll(&persons); err != nil {
		panic(err.Error())
	} else {
		for _, per := range persons {
			fmt.Println(strings.Repeat(" ", 4) + per.String())
		}
	}

	fmt.Println("\nRemain employees:")

	if err = s.GetAll(&employees); err != nil {
		panic(err.Error())
	} else {
		fEmployees := []*models.Employee{}
		for _, emp := range employees {
			if fEmp, err := s.GetEmployee(emp.Id); err != nil {
				panic(err.Error())
			} else {
				fEmployees = append(fEmployees, fEmp)
			}
		}

		for _, emp := range fEmployees {
			fmt.Println(strings.Repeat(" ", 4) + emp.String())
		}
	}

	fmt.Print("\nDelete Department Two... ")

	if err = s.Remove(dep2); err != nil {
		panic(err.Error())
	}

	fmt.Println("done")

	fmt.Print("\nRemain departments count: ")

	if err := s.GetAll(&departments); err != nil {
		panic(err.Error())
	}

	fmt.Println(len(departments))

	fmt.Println("\nRemain persons:")

	if err = s.GetAll(&persons); err != nil {
		panic(err.Error())
	} else {
		for _, per := range persons {
			fmt.Println(strings.Repeat(" ", 4) + per.String())
		}
	}

	fmt.Print("\nRemain employees count: ")

	if err := s.GetAll(&employees); err != nil {
		panic(err.Error())
	}

	fmt.Println(len(employees))

	fmt.Print("\nDelete persons... ")

	ids := []interface{}{}
	for _, per := range persons {
		ids = append(ids, per.Id)
	}

	if err = s.RemoveRange(&persons, ids); err != nil {
		panic(err.Error())
	}

	fmt.Println("done")

	fmt.Print("\nRemain persons count: ")

	if err = s.GetAll(&persons); err != nil {
		panic(err.Error())
	}

	fmt.Println(len(persons))
}
