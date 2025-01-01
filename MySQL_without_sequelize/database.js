import mysql from 'mysql2'

import dotenv from 'dotenv'
dotenv.config()

// database connection : localhost 

// pool = collection of connection
const pool = mysql.createPool({
    host : process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE
}).promise()


export async function getNotes() {
    const [rows] = await pool.query("SELECT * FROM notes")
    return rows;
}

export async function getNotesFromId(id) {
    const [rows] = await pool.query(`
    SELECT * FROM notes
    WHERE id = ?
    `, [id])
    return rows;
}

export async function createNote(title, content){
    const result = await pool.query(`
     INSERT INTO notes (title, content)
     VALUES (?, ?)
    `, [title, content])
    //return result;
    return {
        id: result.insertId,
        title,
        content
    }
}

const notes = await getNotes()
console.log(notes) // displays only rows

const note = await getNotesFromId(2)
console.log('from id',note) 

const creates = await createNote('test','content')
console.log('created',creates) 
