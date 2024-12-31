
import express from 'express';
import dotenv from 'dotenv'
import { connection } from './db/postgres-connection.js';

dotenv.config();

const app = express();
const port = process.env.PORT || 8000;


app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get('/', (req, res) => {
  res.send('Hello, Express setup with postgres');
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});

connection();