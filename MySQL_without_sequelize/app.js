import express from 'express'

import { getNotes, getNotesFromId, createNote } from './database'
const app = express()

app.get('/notes', async (req,res)=>{
    const notes= await getNotes()
    res.send(notes)
})

app.get('/notes/:id', async (req,res)=>{
    const id= req.params.id;
    const note= await getNotesFromId(id)
    res.send(note)
})

app.post('/notes', async (req,res)=>{
    const {title, body}= req.body;
    const note = await createNote(title, content)
    res.status(201).send('Note created')
})

app.use((err,req,res,next)=>{
    console.log(err.stack)
    res.status(500).send()
})

app.listen(8080, ()=>{
    console.log('Server is running on port 8080')
})
