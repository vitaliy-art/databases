package.path = package.path .. ";/lib/4DaysORM/?.lua"
package.cpath = package.cpath .. ";/workspaces/database/Lua/4DaysORM/lua_modules/lib/lua/5.4/?.so"
print(package.path)

require("luasql.sqlite3")
require("orm.model")

print "hello"
