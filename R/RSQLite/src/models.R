library(R6)

department <- R6Class(
    "department",
    public = list(
        id = NULL,
        name = NULL,
        initialize = function(id = NA_integer_, name = NA_character_) {
            self$id <- id
            self$name <- name
        },

        tostring = function() {
            sprintf(
                "{ Department: { Id: %d, Name: %s } }",
                self$id, self$name
            )
        }
    )
)

my_person <- R6Class(
    "my_person",
    public = list(
        id = NULL,
        name = NULL,
        address = NULL,
        birthDate = NULL,
        initialize = function(
            id = NA_character_,
            name = NA_character_,
            address = NA_character_,
            birth_date = NA_character_
        ) {
            self$id <- id
            self$name <- name
            self$address <- address
            self$birthDate <- birth_date
        },

        tostring = function() {
            sprintf(
                "{ Person: { Id: %s, Name: %s, Address: %s, BirthDate: %s } }", # nolint: object_length_linter, object_name_linter, line_length_linter.
                self$id, self$name, self$address, self$birthDate
            )
        }
    )
)

position <- c(
    Staffer = 0L,
    Manager = 1L,
    Boss = 2L
)

employee <- R6Class(
    "employee",
    public = list(
        id = NULL,
        department = NULL,
        departmentId = NULL,
        person = NULL,
        personId = NULL,
        position = NULL,
        initialize = function(
            id = NA_character_,
            department = NA,
            department_id = NA_integer_,
            person = NA,
            person_id = NA_integer_,
            position = NA_integer_
        ) {
            self$id <- id
            self$department <- department
            self$departmentId <- department_id
            self$person <- person
            self$personId <- person_id
            self$position <- position
        },

        tostring = function() {
            pos <- "unknown"
            if (self$position == position["Staffer"]) {
                pos <- "Staffer"
            } else if (self$position == position["Manager"]) {
                pos <- "Manager"
            } else if (self$position == position["Boss"]) {
                pos <- "Boss"
            }

            per_str <- self$person$tostring()
            dep_str <- self$department$tostring()
            sprintf(
                "{ Employee: { Id: %s, Person: %s, Department: %s, Position: %s } }", # nolint: line_length_linter.
                self$id, per_str, dep_str, pos
            )
        }
    )
)
