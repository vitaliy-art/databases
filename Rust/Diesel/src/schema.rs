// @generated automatically by Diesel CLI.

diesel::table! {
    departments (id) {
        id -> Integer,
        name -> Text,
    }
}

diesel::table! {
    employees (id) {
        id -> Text,
        person_id -> Text,
        department_id -> Integer,
        position -> Integer,
    }
}

diesel::table! {
    people (id) {
        id -> Text,
        name -> Text,
        address -> Text,
        birth_date -> Text,
    }
}

diesel::joinable!(employees -> departments (department_id));
diesel::joinable!(employees -> people (person_id));

diesel::allow_tables_to_appear_in_same_query!(departments, employees, people,);
