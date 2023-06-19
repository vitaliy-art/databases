library(DBI)
library(uuid)
library(R6)
source("./src/models.R")

storage <- R6Class( # nolint: cyclocomp_linter.
    "storage",
    public = list(
        conn = NULL,
        initialize = function(conn = NA) {
            self$conn <- conn
            res <- dbSendStatement(
                conn,
                "PRAGMA foreign_keys = ON;"
            )

            dbClearResult(res)
        },

        addDepartment = function(name) {
            res <- dbSendQuery(
                self$conn,
                "SELECT max(id) as last_id FROM departments;"
            )

            row <- dbFetch(res, 1)
            dbClearResult(res)
            last_id <- row$last_id
            if (is.na(last_id)) {
                last_id <- 0
            }

            id <- last_id + 1
            dbAppendTable(
                self$conn,
                "departments",
                data.frame(id = id, name = name)
            )

            department$new(id = id, name = name)
        },

        addPerson = function(name, address, birth_date) {
            id <- as.character(UUIDgenerate())
            dbAppendTable(
                self$conn,
                "people",
                data.frame(
                    id = id,
                    name = name,
                    address = address,
                    birth_date = birth_date
                )
            )

            my_person$new(
                id = id,
                name = name,
                address = address,
                birth_date = birth_date
            )
        },

        addEmployee = function(per, dep, position) {
            id <- as.character(UUIDgenerate())
            dbAppendTable(
                self$conn,
                "employees",
                data.frame(
                    id = id,
                    person_id = per$id,
                    department_id = dep$id,
                    position = position
                )
            )

            employee$new(
                id = id,
                person = per,
                person_id = per$id,
                department = dep,
                department_id = dep$id,
                position = position
            )
        },

        addEmployeeAndPerson = function(
            dep, name, address, birth_date, position
        ) {
            per <- self$addPerson(name, address, birth_date)
            self$addEmployee(per, dep, position)
        },

        getDepartmentById = function(id = NA_integer_) {
            res <- dbSendQuery(
                self$conn,
                "SELECT * FROM departments WHERE id = ?"
            )

            dbBind(res, list(id))
            row <- dbFetch(res, 1)
            dbClearResult(res)
            department$new(id = as.integer(row$id), name = row$name)
        },

        getPersonById = function(id = NA_character_) {
            res <- dbSendQuery(
                self$conn,
                "SELECT * FROM people WHERE id = ?"
            )

            dbBind(res, list(id))
            row <- dbFetch(res, 1)
            dbClearResult(res)
            my_person$new(
                id = row$id,
                name = row$name,
                address = row$address,
                birth_date = row$birth_date
            )
        },

        getEmployeeById = function(id = NA_character_) {
            res <- dbSendQuery(
                self$conn,
                "SELECT * FROM employees WHERE id = ?"
            )

            dbBind(res, list(id))
            row <- dbFetch(res, 1)
            dbClearResult(res)
            dep <- self$getDepartmentById(row$department_id)
            per <- self$getPersonById(row$person_id)
            employee(
                id = row$id,
                department = dep,
                department_id = row$department_id,
                person = per,
                person_id = row$person_id,
                position = row$position
            )
        },

        getAllDepartments = function() {
            res <- dbSendQuery(
                self$conn,
                "SELECT * FROM departments;"
            )

            rows <- dbFetch(res)
            dbClearResult(res)
            departments <- list()
            if (nrow(rows) > 0) {
                departments <- apply(rows, 1, function(row) {
                    department$new(
                        id = as.integer(row["id"]),
                        name = row["name"]
                    )
                })
            }

            departments
        },

        getAllPeople = function() {
            res <- dbSendQuery(
                self$conn,
                "SELECT * FROM people;"
            )

            rows <- dbFetch(res)
            dbClearResult(res)
            people <- list()
            if (nrow(rows) > 0) {
                people <- apply(rows, 1, function(row) {
                    my_person$new(
                        id = row["id"],
                        name = row["name"],
                        address = row["address"],
                        birth_date = row["birth_date"]
                    )
                })
            }

            people
        },

        getAllEmployees = function() {
            res <- dbSendQuery(
                self$conn,
                "SELECT * FROM employees;"
            )

            rows <- dbFetch(res)
            dbClearResult(res)
            employees <- list()
            if (nrow(rows) > 0) {
                employees <- apply(rows, 1, function(row) {
                    dep <- self$getDepartmentById(
                        as.integer(row["department_id"])
                    )

                    per <- self$getPersonById(row["person_id"])
                    employee$new(
                        id = row["id"],
                        department = dep,
                        department_id = as.integer(row["department_id"]),
                        person = per,
                        person_id = row["person_id"],
                        position = as.integer(row["position"])
                    )
                })
            }

            employees
        },

        updateDepartment = function(dep = NA) {
            res <- dbSendStatement(
                self$conn,
                "UPDATE departments SET name = ? WHERE id = ?;"
            )

            dbBind(res, list(dep$name, dep$id))
            affected <- dbGetRowsAffected(res)
            dbClearResult(res)
            affected
        },

        updatePerson = function(per = NA) {
            res <- dbSendStatement(
                self$conn,
                "UPDATE people SET name = ?, address = ?, birth_date = ? WHERE id = ?;" # nolint: line_length_linter.
            )

            dbBind(res, list(per$name, per$address, per$birthDate, per$id))
            affected <- dbGetRowsAffected(res)
            dbClearResult(res)
            affected
        },

        updateEmployee = function(emp = NA) {
            res <- dbSendStatement(
                self$conn,
                "UPDATE employees SET department_id = ?, person_id = ?, position = ? WHERE id = ?" # nolint: line_length_linter.
            )

            department_id <- emp$department_id
            if (department_id != emp$department$id) {
                department_id <- emp$department$id
            }

            person_id <- emp$person_id
            if (person_id != emp$person$id) {
                person_id <- emp$person$id
            }

            dbBind(res, list(department_id, person_id, position, emp$id))
            affected <- dbGetRowsAffected(res)
            dbClearResult(res)
            affected
        },

        delete = function(entities) {
            dep_ids <- list()
            per_ids <- list()
            emp_ids <- list()
            affected <- 0
            for (entity in entities) {
                type <- class(entity)
                switch(
                    type[1],
                    "department" = {
                        dep_ids <- append(dep_ids, entity$id)
                    },
                    "my_person" = {
                        per_ids <- append(per_ids, entity$id)
                    },
                    "employee" = {
                        emp_ids <- append(emp_ids, entity$id)
                    }
                )
            }

            get_raw_in_ids_int <- function(ids) {
                raw <- "("
                for (id in ids) {
                    raw <- sprintf("%s%s,", raw, as.character(id))
                }

                raw <- gsub(",,", ")", sprintf("%s,", raw))
            }

            get_raw_in_ids_char <- function(ids) {
                raw <- "("
                for (id in ids) {
                    raw <- sprintf("%s'%s',", raw, id)
                }

                raw <- gsub(",,", ")", sprintf("%s,", raw))
            }

            if (length(dep_ids) > 0) {
                query <- sprintf(
                    "DELETE FROM departments WHERE id IN %s",
                    get_raw_in_ids_int(dep_ids)
                )

                res <- dbSendStatement(self$conn, query)
                affected <- affected + dbGetRowsAffected(res)
                dbClearResult(res)
            }

            if (length(per_ids) > 0) {
                query <- sprintf(
                    "DELETE FROM people WHERE id IN %s",
                    get_raw_in_ids_char(per_ids)
                )

                res <- dbSendStatement(self$conn, query)
                affected <- affected + dbGetRowsAffected(res)
                dbClearResult(res)
            }

            if (length(emp_ids) > 0) {
                query <- sprintf(
                    "DELETE FROM employees WHERE id IN %s",
                    get_raw_in_ids_char(emp_ids)
                )

                res <- dbSendStatement(self$conn, query)
                affected <- affected + dbGetRowsAffected(res)
                dbClearResult(res)
            }

            affected
        }
    )
)
