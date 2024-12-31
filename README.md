# PostgreSQL || Postgres

relational database management system (RDBMS) known for its reliability, robustness, and adherence to SQL standards.

## Resources
 [postgreSQL Documentation]( https://www.postgresql.org/docs/ )
## Installations:
- psql - Shell for CLI operations 
```bash
psql --version
```
- pgAdmin - GUI operations

default port number: 5432

## Some shell Commands (shortcuts) in psql
Write commands after `#` in psql, Initially shell looks like:
```bash
postgress=#
```

- To show all the databases: `\l`
- To switch to particular db: `\c db_name`
    ```bash
    db_name=#
    ```
- To see a table inside a db: `\d table_name`

