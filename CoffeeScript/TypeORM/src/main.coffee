import { createConnection } from "typeorm"

connConfig =
  type: "sqlite",
  database: "bd.db",
  synchronize: on,
  logging: off,
  entities: [

  ]

createConnection connConfig
  .then (conn) ->
  console.log "Success!"
