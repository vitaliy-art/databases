package models

import slick.ast.TypedType
import slick.jdbc.SQLiteProfile.api.*

import java.util.UUID

object Position:
  val Staffer = 1
  val Manager = 2
  val Boss = 3
  def toString(position: Int) = position match
    case Staffer => "Staffer"
    case Manager => "Manager"
    case Boss => "Boss"
    case _ => "Unknown"


final case class Employee(var id: Option[UUID], departmentId: Int, personId: UUID, position: Int):
  id = if !id.isEmpty then id else Some(UUID.randomUUID())
  var dep: Option[Department] = None
  var per: Option[Person] = None
  def this(department: Department, person: Person, position: Int) =
    this(None, department.id.get, person.id.get, position)
    dep = Some(department)
    per = Some(person)

  override def toString =
    s"Department { Id: ${if !id.isEmpty then id.get else ""}, " +
    s"Person: ${if !per.isEmpty then per.get else "{}"}, " +
    s"Department: ${if !dep.isEmpty then dep.get else "{}"}, " +
    s"Position: ${Position.toString(position)} }"

class Employees(tag: Tag) extends Table[Employee](tag, "employees"):
  def id = column[UUID]("id", O.PrimaryKey)
  def departmentId = column[Int]("department_id")
  def department = foreignKey("dep_fk", departmentId, departments)(_.id, onUpdate = ForeignKeyAction.Restrict, onDelete = ForeignKeyAction.Cascade)
  def personId = column[UUID]("person_id")
  def person = foreignKey("per_fk", personId, people)(_.id, onUpdate = ForeignKeyAction.Restrict, onDelete = ForeignKeyAction.Cascade)
  def position = column[Int]("position")
  def * = (id.?, departmentId, personId, position).mapTo[Employee]

val employees = TableQuery[Employees]
