## Apply migration

```bash
sqlite3 bd.db ".read init_db.sql"
```

## Install packages
```bash
R -q -e 'renv:restore()'
```
