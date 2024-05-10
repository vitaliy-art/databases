import models.Position
import repository.SqliteRepository
import slick.jdbc.SQLiteProfile.api.*

import java.time.LocalDate
import scala.concurrent.Await
import scala.concurrent.Awaitable
import scala.concurrent.duration.Duration

def await[T](awaitable: Awaitable[T]) = Await.result(awaitable, Duration.Inf)

@main def main() =
  val db = Database.forConfig("database")
  val repo = SqliteRepository(db)

  print("Clean up database... ")
  val departments = await(repo.getAllDepartments)
  var people = await(repo.getAllPeople)
  val employees = await(repo.getAllEmployees)
  await(repo.deleteDepartments(departments.toList))
  await(repo.deletePeople(people.toList))
  await(repo.deleteEmployees(employees.toList))
  println("done")
  println()

  print("Add departments... ")
  val dep1 = await(repo.addDepartment("Department One"))
  var dep2 = await(repo.addDepartment("Department Two"))
  println("done")
  println()

  println("Added departments:")
  await(repo.getAllDepartments).map(println)
  println()

  print("Add people... ")
  var per1 = await(repo.addPerson("Ivan", "Moscow", LocalDate.parse("1990-10-02")))
  val per2 = await(repo.addPerson("John", "London", LocalDate.parse("1998-01-14")))
  println("done")
  println()

  println("Added people:")
  await(repo.getAllPeople).map(println)
  println()

  print("Add employees... ")
  await(repo.addEmployee(dep1, per1, Position.Staffer))
  await(repo.addEmployee(dep1, per2, Position.Staffer))
  await(repo.addEmployeeAndPerson(dep2, "Nick", "Berlin", LocalDate.parse("1995-02-23"), Position.Manager))
  await(repo.addEmployeeAndPerson(dep2, "Stan", "Oslo", LocalDate.parse("1988-04-21"), Position.Boss))
  println("done")
  println()

  println("Added employees:")
  await(repo.getAllEmployees).map(println)

  print("Delete Department One... ")
  await(repo.deleteDepartments(List(dep1)))
  println("done")
  println()

  print("Update Department Two... ")
  dep2 = dep2.copy(name = "Department")
  await(repo.updateDepartment(dep2))
  println("done")
  println()

  print("Update Ivan... ")
  per1 = per1.copy(address = "Tula")
  await(repo.updatePerson(per1))
  println("done")
  println()

  println("Remain departments:")
  await(repo.getAllDepartments).map(println)
  println()

  println("Remain people:")
  await(repo.getAllPeople).map(println)
  println()

  println("Remain employees:")
  await(repo.getAllEmployees).map(println)
  println()

  print("Delete Department Two... ")
  await(repo.deleteDepartments(List(dep2)))
  println("done")
  println()

  print("Remain departments count: ")
  println(await(repo.getAllDepartments).length)
  println()

  println("Remain people:")
  await(repo.getAllPeople).map(println)
  println()

  print("Remain employees count: ")
  println(await(repo.getAllEmployees).length)
  println()

  print("Delete people... ")
  people = await(repo.getAllPeople)
  await(repo.deletePeople(people.toList))
  println("done")
  println()

  print("Remain people count: ")
  println(await(repo.getAllPeople).length)
  println()
