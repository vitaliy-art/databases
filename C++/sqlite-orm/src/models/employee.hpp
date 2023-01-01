#pragma once
#include <string>
#include <fmt/format.h>

using std::string;


enum Position {Boss, Manager, Staffer};

template <>
struct fmt::formatter<Position>: fmt::formatter<fmt::string_view> {
    template <typename FormatterContext>
    auto format(const Position pos, FormatterContext &ctx) const {
        string_view name = "unknown";
        switch (pos) {
            case Position::Boss:    name = "Boss";    break;
            case Position::Manager: name = "Manager"; break;
            case Position::Staffer: name = "Staffer"; break;
        }

        return formatter<string_view>::format(name, ctx);
    };
};

struct Employee{
public:
    string id;
    string personId;
    Person person;
    int departmentId;
    Department department;
    int position;

    Employee() {}
    Employee(string personId, int departmentId, Position position) : personId(personId), departmentId(departmentId), position(position) {}
};

template <>
struct fmt::formatter<Employee>: fmt::formatter<fmt::string_view> {
    template <typename FormatterContext>
    auto format(const Employee &emp, FormatterContext &ctx) const -> decltype(ctx.out()) {
        return fmt::format_to(ctx.out(), "Employee: {{ Id: {}, Person: {}, Department: {}, Position: {} }}", emp.id, emp.person, emp.department, Position(emp.position));
    };
};
