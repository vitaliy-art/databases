package models

import slick.jdbc.SQLiteProfile.api.*

final case class Department(id: Option[Int], name: String):
  def this(name: String) =
    this(None, name)

  override def toString = s"Department { Id: ${id.getOrElse(0)}, Name: $name }"

class Departments(tag: Tag) extends Table[Department](tag, "department"):
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def name = column[String]("name")
  def * = (id.?, name).mapTo[Department]

val departments = TableQuery[Departments]
