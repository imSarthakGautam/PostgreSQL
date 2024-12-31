import { Sequelize } from 'sequelize';
import dotenv from 'dotenv'
dotenv.config();

let database= process.env.DB_NAME;
let username= process.env.DB_USERNAME;
let password= process.env.DB_PASSWORD;
console.log(database, username, password)
const host = process.env.DB_HOST || 'localhost';
const port = process.env.DB_PORT || 5432;

const sequelize = new Sequelize(
    database,
    username,
    password, 
    {
        host,
        port,
        dialect:'postgres'
    }
  );

//connection
let connection = async()=>{
    try {
        await sequelize.authenticate();
        console.log('Connection has been established successfully.');
      } catch (error) {
        console.error('Unable to connect to the database:', error);
        process.exit(1);
      }
}

export {connection}