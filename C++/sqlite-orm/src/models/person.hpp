#pragma once
#include <string>
#include <fmt/format.h>

using std::string;


struct Person{
public:
    string id;
    string name;
    string address;
    long birthDate;

    Person() {}
    Person(string name, string address, long birthDate = 0) : name(name), address(address), birthDate(birthDate) {}

    Person(string name, string address, int birthYear, int birthMon, int birthDay) : Person(name, address) {
        struct tm date = {0};
        date.tm_year = birthYear - 1900;
        date.tm_mon = birthMon - 1;
        date.tm_mday = birthDay;
        auto epoch = timegm(&date);
        this->birthDate = epoch;
    }
};

template <>
struct fmt::formatter<Person>: fmt::formatter<fmt::string_view> {
    template <typename FormatContext>
    auto format(const Person &per, FormatContext &ctx) const -> decltype(ctx.out()) {
        return fmt::format_to(ctx.out(), "Person {{ Id: {}, Name: {}, Address: {}, BirthDate: {:%Y-%m-%d} }}", per.id, per.name, per.address, fmt::gmtime(per.birthDate));
    };
};
