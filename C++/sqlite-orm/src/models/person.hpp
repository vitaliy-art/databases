#pragma once
#include <string>
#include <fmt/format.h>
#include <boost/lexical_cast.hpp>
#include <boost/uuid/random_generator.hpp>
#include <boost/uuid/uuid_io.hpp>

using std::string;


struct Person{
public:
    string id;
    string name;
    string address;
    long birthDate;

    Person() {}

    Person(string name, string address, long birthDate = 0) : name(name), address(address), birthDate(birthDate) {
        boost::uuids::random_generator gen;
        this->id = boost::lexical_cast<string>(gen());
    }

    Person(string name, string address, int birth_year, int birth_mon, int birth_day) : Person(name, address) {
        struct tm date = {0};
        date.tm_year = birth_year - 1900;
        date.tm_mon = birth_mon - 1;
        date.tm_mday = birth_day;
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
