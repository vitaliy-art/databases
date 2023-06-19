library(DBI)
source("./src/storage.R")
source("./src/models.R")

conn <- dbConnect(RSQLite::SQLite(), "bd.db")
stor <- storage$new(conn = conn)

cat("Clean up database... ")
departments <- stor$getAllDepartments()
people <- stor$getAllPeople()
employees <- stor$getAllEmployees()
stor$delete(c(departments, people, employees))
cat("done\n")

cat("\nAdd departments... ")
dep1 <- stor$addDepartment("Department One")
dep2 <- stor$addDepartment("Department Two")
cat("done\n")

cat("\nAdded departments:\n")
departments <- stor$getAllDepartments()
for (dep in departments) {
    print(dep$tostring())
}

cat("\nAdd people... ")
per1 <- stor$addPerson("Ivan", "Moscow", "1990-10-2")
per2 <- stor$addPerson("John", "London", "1998-01-14")
cat("done\n")

cat("\nAdded people:\n")
people <- stor$getAllPeople()
for (per in people) {
    print(per$tostring())
}

cat("\nAdd employees... ")
stor$addEmployee(per1, dep1, position["Staffer"])
stor$addEmployee(per2, dep1, position["Staffer"])
stor$addEmployeeAndPerson(
    dep2, "Nick", "Berlin", "1995-02-23", position["Manager"]
)
stor$addEmployeeAndPerson(
    dep2, "Stan", "Oslo", "1988-04-21", position["Boss"]
)
cat("done\n")

cat("\nAdded employees:\n")
employees <- stor$getAllEmployees()
for (emp in employees) {
    print(emp$tostring())
}

cat("\nDelete Department One... ")
stor$delete(list(dep1))
cat("done\n")

cat("\nUpdate Department Two... ")
dep2$name <- "Department"
stor$updateDepartment(dep2)
cat("done\n")

cat("\nUpdate Ivan... ")
per1$address <- "Tula"
stor$updatePerson(per1)
cat("done\n")

cat("\nRemain departments:\n")
departments <- stor$getAllDepartments()
for (dep in departments) {
    print(dep$tostring())
}

cat("\nRemain people:\n")
people <- stor$getAllPeople()
for (per in people) {
    print(per$tostring())
}

cat("\nRemain employees:\n")
employees <- stor$getAllEmployees()
for (emp in employees) {
    print(emp$tostring())
}

cat("\nDelete Department Two... ")
stor$delete(list(dep2))
cat("done\n")

cat("\nRemain departments count: ")
departments <- stor$getAllDepartments()
cat(sprintf("%d\n", length(departments)))

cat("\nRemain people count: ")
people <- stor$getAllPeople()
cat(sprintf("%d\n", length(people)))

cat("\nRemain employees count: ")
employees <- stor$getAllEmployees()
cat(sprintf("%d\n", length(employees)))

cat("\nDelete people... ")
stor$delete(c(people))
cat("done\n")

cat("\nRemain people count: ")
people <- stor$getAllPeople()
cat(sprintf("%d\n", length(people)))
