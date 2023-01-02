#pragma once
#include <string>
#include <fmt/format.h>

using std::string;


struct Department{
public:
    int id;
    string name;

    Department() {}
    Department(string name) : id(-1), name(name) {}
};

template <>
struct fmt::formatter<Department>: fmt::formatter<fmt::string_view> {
    template <typename FormatContext>
    auto format(const Department &dep, FormatContext & ctx) const -> decltype(ctx.out()) {
        return fmt::format_to(ctx.out(), "Department {{ Id: {:d}, Name: {} }}", dep.id, dep.name);
    };
};
