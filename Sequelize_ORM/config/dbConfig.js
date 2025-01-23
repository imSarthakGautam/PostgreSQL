 const config ={
    HOST: 'localhost',
    USER: 'root',
    PASSWORD: 'mysql_pw',
    DB: 'node_sequelize_api_db',
    dialect: 'mysql',

    // configures the connection pool.
    // A connection pool is a mechanism that maintains a set of open database connections
    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
    }
}

export default config;