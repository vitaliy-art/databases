require "rubygems"
require "active_record"
require_relative "models/department"
require_relative "models/person"
require_relative "models/employee"

puts

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "bd.db",
)

Department = Models::Department
Person = Models::Person
Employee = Models::Employee

print "Clean up database... "
[Department, Person, Employee].each do |c| c.destroy_all end
puts "done"
puts

print "Add departments... "
dep1 = Department.create(name: "Department One")
dep2 = Department.create(name: "Department Two")
puts "done"
puts

puts "Added departments:"
Department.all.each do |d| puts d end
puts

print "Add people... "
per1 = Person.create(name: "Ivan", address: "Moscow", birth_date: "1990-10-02")
per2 = Person.create(name: "John", address: "London", birth_date: "1998-01-14")
puts "done"
puts

puts "Added people:"
Person.all.each do |p| puts p end
puts

print "Add employees... "
Employee.create(person: per1, department: dep1, position: :Staffer)
Employee.create(person: per2, department: dep1, position: :Staffer)
Employee.create(person: Person.create(name: "Nick", address: "Berlin", birth_date: "1995-02-23"), department: dep2, position: :Manager)
Employee.create(person: Person.create(name: "Stan", address: "Oslo", birth_date: "1988-04-21"), department: dep2, position: :Boss)
puts "done"
puts

puts "Added employees:"
Employee.all.each do |e| puts e end
puts

print "Delete Department One... "
dep1.destroy
puts "done"
puts

print "Update Department Two... "
dep2.name = "Department"
dep2.save
puts "done"
puts

print "Update Ivan... "
per1.address = "Tula"
per1.save
puts "done"
puts

puts "Remain departments:"
Department.all.each do |d| puts d end
puts

puts "Remain people:"
Person.all.each do |p| puts p end
puts

puts "Remain employees:"
Employee.all.each do |e| puts e end
puts

print "Delete Department Two... "
dep2.destroy
puts "done"
puts

puts "Remain departments count: #{Department.all.count}"
puts

puts "Remain people count: #{Person.all.count}"
puts

puts "Remain employees count: #{Employee.all.count}"
puts

print "Delete people... "
Person.destroy_all
puts "done"
puts

puts "Remain people count: #{Person.all.count}"
