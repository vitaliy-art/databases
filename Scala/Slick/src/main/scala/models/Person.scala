package models

import slick.jdbc.SQLiteProfile.api.*

import java.time.LocalDate
import java.util.UUID

final case class Person(var id: Option[UUID], name: String, address: String, birthDate: LocalDate):
  id = if !id.isEmpty then id else Some(UUID.randomUUID())
  def this(name: String, address: String, birthDate: LocalDate) =
    this(None, name, address, birthDate)

  override def toString =
    s"Person { Id: ${if !id.isEmpty then id.get else ""}, Name: $name, Address: $address, BirthDate: $birthDate }"

class People(tag: Tag) extends Table[Person](tag, "people"):
  def id = column[UUID]("id", O.PrimaryKey)
  def name = column[String]("name")
  def address = column[String]("address")
  def birthDate = column[LocalDate]("birth_date")
  def * = (id.?, name, address, birthDate).mapTo[Person]

val people = TableQuery[People]
