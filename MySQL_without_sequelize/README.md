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


