import express from 'express'
const app = express();

import cors from 'cors'

let corsOptions = {
  origin: 'https://localhost:8000'
}

//---------- MIDDLEWARES -------
app.use(cors(corsOptions))
app.use(express.json())
app.use(express.urlencoded({extended:true}))




app.get('/', (req, res) => {
  res.send('Hello, Express!');
});

const port = process.env.PORT || 8000;
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});