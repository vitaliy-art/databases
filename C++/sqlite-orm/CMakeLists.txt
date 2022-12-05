cmake_minimum_required(VERSION 3.15)

project(SqliteOrmTest CXX)

find_package(fmt REQUIRED)
find_package(SqliteOrm REQUIRED)

add_executable(sqliteOrmExample src/main.cxx)
target_compile_features(sqliteOrmExample PRIVATE cxx_std_17)

target_link_libraries(sqliteOrmExample
    PRIVATE
        fmt::fmt
        sqlite_orm::sqlite_orm)
