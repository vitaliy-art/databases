## Apply migration

```bash
sqlite3 example/bd.db ".read init_db.sql"
```

## Run example

```bash
cd example
lein run
```

### Compile jar and run

```bash
cd example
lein uberjar
java -jar <created_standalone_jar>
```
