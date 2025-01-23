import express, { Request, Response } from "express";
import "reflect-metadata";
import { DataSource } from "typeorm";
import userRoutes from './routes'

const app = express();
const port = 3000;
app.use(express.json()); // Parse incoming JSON requests

// routes
app.use('/', userRoutes)

// configure connection to DB: store in .env
export const AppDataSource = new DataSource({
  type: "postgres",
  host: "localhost",
  port: 5432,
  username: "postgres",
  password: "postgre_pw",
  database: "typeorm_db",

  // Entity registration and synchronize entities with DB table
  entities: ["src/entities/*{.ts, .js}"],
  synchronize: true,
  logging: true, // displays logs from typeORM
});

//initialize App Data Source
AppDataSource.initialize()
  .then(() => {
    console.log("Database Connected Successfully");
    // Start server
    app.listen(port, () => {
      console.log(`Server listening on port ${port}`);
    });
  })
  .catch((err) => console.log("error connecting to database", err));
