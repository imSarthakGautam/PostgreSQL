import dbConfig from '../config/dbConfig'
import { Sequelize, DataTypes } from 'sequelize'
//imports Sequelize class and DataTypes object from sequelize library


//creating new Sequelize instance, specifying connection details
const sequelize = new Sequelize(
  dbConfig.DB,
  dbConfig.USER,
  dbConfig.PASSWORD, 
  {
    host: dbConfig.HOST,
    dialect: dbConfig.dialect,
    operatorsAliases: false, //overwrites the errors

    pool: {
      max: dbConfig.pool.max,
      min: dbConfig.pool.min,
      acquire: dbConfig.pool.acquire,
      idle: dbConfig.pool.idle

  }
  }
)

sequelize.authenticate()
.then(()=>{
  console.log('Connected..')
})
.catch(err=> {
  console.log(err)
})

//object to Store reference to Sequelize and connection instance.
const db = {}

//stores imported Sequelize class in db object for future
db.Sequelize = Sequelize

// stores sequelize connection instance in db object
db.sequelize = sequelize