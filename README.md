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



---
# NodeJs Setup with Sequelize

After setting up Node/express application, using sequelize orm:
```bash
npm install --save sequelize
```
drivers installlation for postgres

```bash
npm install --save pg pg-hstore # Postgres
```

## DB Connection
```js
const { Sequelize } = require('sequelize');
const sequelize = new Sequelize('database', 'username', 'password', {
  host: 'localhost',
  dialect:'postgres' /* or one of 'mysql' | 'sqlite' | 'mariadb' | 'mssql' | 'db2' | 'snowflake' | 'oracle' */
});
```

Testing the connection
```js
try {
  await sequelize.authenticate();
  console.log('Connection has been established successfully.');
} catch (error) {
  console.error('Unable to connect to the database:', error);
  process.exit(1); // Exit process on failure
}
```

## Models creation
syntax: `sequelize.define(modelName, attributes, options)`
- **Model Name:** The first argument to sequelize.define is the model name (e.g., 'User'). Sequelize will automatically pluralize this to determine the table name in the database (e.g., users). You can override this with the tableName option.

- **Attributes (Columns):** The second argument is an object defining the model's attributes (columns).
1. type: Specifies the data type (e.g., DataTypes.INTEGER, DataTypes.STRING, DataTypes.DATE, DataTypes.BOOLEAN, DataTypes.UUID, etc.).
2. primaryKey: Marks the attribute as the primary key.
3. autoIncrement: Automatically increments the value for each new record (usually used with integer primary keys).
4. allowNull: Specifies whether the attribute can be NULL.
5. unique: Ensures that the values in this column are unique.
6. validate: Provides validation rules for the attribute (e.g., isEmail, len, isIn, isNumeric).

- **Options Object (Third Argument):**
1. tableName: Specifies the actual table name in the database (if it's different from the model name).
2. timestamps: If set to true (default), Sequelize will automatically add createdAt and updatedAt columns. Set to false if you don't want this behavior.
3. underscored: If set to true, Sequelize will use snake_case for column names (e.g., first_name) instead of camelCase (e.g., firstName). This is a common convention in PostgreSQL.
```js
const User = sequelize.define(
    // Model name (singular, capitalized)
  'User',

  {
    // Model attributes are defined here
    firstName: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    lastName: {
      type: DataTypes.STRING,
      // allowNull defaults to true
    },
  },
  {
    // Other model options go here
    tableName: 'users', // Optional: If the table name in the database is different from the model name
    timestamps: true, // Optional: If you don't want Sequelize to manage createdAt and updatedAt
    underscored: true, // Optional: Use snake_case for column names instead of camelCase
  },
);
```

### Alternative approach : defining models inside function
```js
// models/User.js
import { DataTypes } from 'sequelize';

export const createUserModel = (sequelize) => {
    const User = sequelize.define('User', { /* ... */ });
    return User;
};
```
Here, the User model is defined inside the createUserModel function. This function takes the sequelize instance as an argument and returns the defined model.

## Synchronize the model with DB
After defining your models, you need to synchronize them with the database to create the corresponding tables. This is usually done in your main application file:
```js
try {
        await sequelize.sync({ force: false }); // Creates tables if they don't exist (safe to use in production)

        // await sequelize.sync({ force: true }); // WARNING: Drops existing tables and recreates them (use with caution in development)

        console.log('Database synced successfully.');
    } catch (error) {
        console.error('Error syncing database:', error);
    }
```

---
# NodeJS setup without sequilize in mysql

## Establishing DB Connection

1. mysql.createConnection 


This is a single connection, lasts until you close it or closed by MySQL
- Blocking: While executing one query, it cannot execute others.

```js
mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'mydb',
});
```


2. mysql.createPool

- It is a place where connections get stored.
- When you request a connection from a pool,you will receive a connection that is not currently being used, or a new connection.
- If you’re already at the connection limit, it will wait until a connection is available before it continues.

- **Non Blocking** : In a pool while one connection is busy running a query, others can be used to execute subsequent queries. Hence, your application will perform good.

```js
mysql.createPool({
  connectionLimit : 10,
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'mydb',
});
```

## Query
Result is stored in 1st array so destructuring extract the value.

```js
const [rows] = await pool.query(`
SELECT * FROM notes
    WHERE id = ?
    `, [id])
```

This method can have SQL injection attack 
```js
const [rows] = await pool.query(`
SELECT * FROM notes
WHERE id = ${id} `)
```

### if not destructuring

 if not destructuring rows:

```js
const result = await pool.query("SELECT * FROM notes")
console.log(result)
```
RESULT format:
[
    [        
        { Row 1 : as object},
        { Row 2 : as object}
    ],

    [   Schema, metadata   ]
]

- To display results only
```js
const rows = result[0]
console.log(rows)
```
RESULT format: 
[
{ Row 1 : as object},
{ Row 2 : as object}
]




