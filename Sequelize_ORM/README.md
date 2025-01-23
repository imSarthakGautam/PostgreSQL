# Sequelize
Sequelize is a powerful Object-Relational Mapper (ORM) for Node.js. 

It simplifies working with relational databases (like PostgreSQL, MySQL, SQLite, and MSSQL) __by allowing you to interact with your database using JavaScript objects and methods instead of writing raw SQL queries.__

```bash
npm i mysql2 sequelize
npm install -g sequelize-cli
```

---

## Connecting to Database:
```js
const sequelize = new Sequelize('database', 'username', 'password', {
  host: 'localhost',
  dialect: /* one of 'mysql' | 'postgres' | 'sqlite' | 'mariadb' | 'mssql' | 'db2' | 'snowflake' | 'oracle' */
});
```

## Testing the connection:

```js
try {
  await sequelize.authenticate();
  console.log('Connection has been established successfully.');
} catch (error) {
  console.error('Unable to connect to the database:', error);
}
```

## Closing the connection:
```js
sequelize.close()
``` 

---

## Sequelize Class
The Sequelize class is the core of the Sequelize library.

 It represents the connection to your database and provides methods for interacting with it. Think of it as the "database manager" object.

 **Key Responsibilities :**
 - Connection Management (DB and Pooling)

 - Model Definition:
 `define()` method to create models = tables in DB

 - Querying :
  methods like `query()`,`findAll()`, `findOne()`, `create()`, `update()`, `destroy()` 

  - Synchronizatin : `sync()` method to synchronize your models with the database schema 

  - Association : Facilitates defining relationships (associations) between models (one-to-one, one-to-many, many-to-many).

## DataTypes Object:
the DataTypes object provides a set of constants that represent the different data types supported by Sequelize and the underlying database. 

These constants are used when defining model attributes (columns).

You use Sequelize's DataTypes (e.g.,    `DataTypes.STRING, DataTypes.INTEGER`) instead of the database's specific types (e.g., `VARCHAR, INT`), making your code more portable across different databases.

**Common DataTypes :**

`DataTypes.STRING`: For variable-length strings.

`DataTypes.TEXT:` For longer text strings.

`DataTypes.INTEGER`: For integers.

`DataTypes.BIGINT`: For large integers.

`DataTypes.FLOAT`: For floating-point numbers.

`DataTypes.DOUBLE`: For double-precision floating-point numbers.

`DataTypes.BOOLEAN`: For boolean values (true/false).

`DataTypes.DATE`: For dates and times.

`DataTypes.DATEONLY`: For dates only.

`DataTypes.UUID`: For universally unique identifiers.

`DataTypes.JSON`: For storing JSON data.

`DataTypes.BLOB`: For binary large objects (e.g., images, files).




sequelize init
forms folder
seeders, models, migrations, config