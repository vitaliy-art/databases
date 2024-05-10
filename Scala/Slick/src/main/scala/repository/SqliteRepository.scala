package repository

import models.*
import slick.jdbc.SQLiteProfile.api.*
import slick.jdbc.SQLiteProfile.backend.Database

import scala.concurrent.{Await, Future}
import scala.concurrent.duration.Duration
import java.time.LocalDate
import scala.concurrent.ExecutionContext.Implicits.global
import java.util.UUID

class SqliteRepository(db: Database):
  Await.result(db.run(DBIO.seq(
    departments.schema.createIfNotExists,
    people.schema.createIfNotExists,
    employees.schema.createIfNotExists,
  )), Duration.Inf)

  def addDepartment(name: String) = db.run(
    (departments returning departments.map(_.id)
      into ((department, id) => department.copy(id = Some(id)))
      ) += new Department(name)
  )

  def addPerson(name: String, address: String, birthDate: LocalDate) = Future {
    val person = new Person(name, address, birthDate)
    Await.result(db.run(people += person), Duration.Inf)
    person
  }

  def addEmployee(department: Department, person: Person, position: Int) = Future {
    val employee = new Employee(department, person, position)
    Await.result(db.run(employees += employee), Duration.Inf)
    employee
  }

  def addEmployeeAndPerson(department: Department, name: String, address: String, birthDate: LocalDate, position: Int) =
    val person = Await.result(addPerson(name, address, birthDate), Duration.Inf)
    addEmployee(department, person, position)

  def getAllDepartments = db.run(
    departments.map(_.mapTo[Department]).result
  )

  def getDepartment(id: Int) = db.run(
    departments.filter(_.id === id).result.headOption
  )

  def getAllPeople = db.run(
    people.map(_.mapTo[Person]).result
  )

  def getPerson(id: UUID) = db.run(
    people.filter(_.id === id).result.headOption
  )

  def getAllEmployees = Future {
    val allEmployees = Await.result(db.run(employees.map(_.mapTo[Employee]).result), Duration.Inf)
    allEmployees.map(emp =>
      emp.dep = Await.result(getDepartment(emp.departmentId), Duration.Inf)
      emp.per = Await.result(getPerson(emp.personId), Duration.Inf)
    )
    allEmployees
  }

  def updateDepartment(department: Department) =
    val q = for d <- departments if d.id === department.id yield (d.name)
    db.run(q.update(department.name))

  def updatePerson(person: Person) =
    val q = for p <- people if p.id === person.id yield (p.name, p.address, p.birthDate)
    db.run(q.update((person.name, person.address, person.birthDate)))

  def updateEmployee(employee: Employee) =
    val q = for e <- employees if e.id === employee.id yield (e.departmentId, e.personId, e.position)
    db.run(q.update((employee.departmentId, employee.personId, employee.position)))

  def deleteDepartments(entries: List[Department]) =
    val ids = for e <- entries if !e.id.isEmpty yield e.id.get
    val q = departments.filter(_.id.inSet(ids))
    db.run(q.delete)

  def deletePeople(entries: List[Person]) =
    val ids = for e <- entries if !e.id.isEmpty yield e.id.get
    val q = people.filter(_.id.inSet(ids))
    db.run(q.delete)

  def deleteEmployees(entries: List[Employee]) =
    val ids = for e <- entries if !e.id.isEmpty yield e.id.get
    val q = employees.filter(_.id.inSet(ids))
    db.run(q.delete)
