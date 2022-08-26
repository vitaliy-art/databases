package = "lsqlite3"
version = "dev-1"
source = {
   url = "*** please add URL for source tarball, zip or repository here ***"
}
description = {
   homepage = "*** please enter a project homepage ***",
   license = "Unlicense"
}
dependencies = {
   "lua ~> 5.4",
   "luasql-sqlite3 >=2.6"
}
build = {
   type = "builtin",
   modules = {}
}
