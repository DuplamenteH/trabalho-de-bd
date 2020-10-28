const express = require('express')
const app = express()
const cors = require('cors')

const pool =  require('./db')


// middleware
app.use(cors())
app.use(express.json())


app.listen(5000,()=>{
    console.log('Servidor no ar')
})


// Rotas

/** */

// Inserção no banco
app.post('/addCasa', async(req,res)=>{
    const {idImovel, imagem, valor,cep,rua,bairro,cidade,estado, tipo , descricao} = req.body;
    try{
        
        const newImovel = await pool.query("insert into imovel (idImovel, imagem, valor,cep,rua,bairro,cidade,estado) values ($1,$2,$3,$4,$5,$6,$7,$8) returning *;",
                                        [idImovel, imagem, valor,cep,rua,bairro,cidade,estado]
                                        );
        const casa = await pool.query("insert into casa (idImovel,descricao,diponibilidade) values ($1,$2,'True') returning *;",
                                                        [idImovel,descricao]       
                                    )

            
       
        res.status(200).send(newImovel.rows[0])

    }catch(err){
        console.log(tipo)
        console.log(descricao)
        console.error(err.message)
    }
})

app.post('/addAp', async(req,res)=>{
    const {idImovel, imagem, valor,cep,rua,bairro,cidade,estado, tipo , descricao} = req.body;
    try{
        
        const newImovel = await pool.query("insert into imovel (idImovel, imagem, valor,cep,rua,bairro,cidade,estado) values ($1,$2,$3,$4,$5,$6,$7,$8) returning *;",
                                        [idImovel, imagem, valor,cep,rua,bairro,cidade,estado]
                                        );
        const casa = await pool.query("insert into apartamento (idImovel,descricao,diponibilidade) values ($1,$2,'True')returning *;",
                                                        [idImovel,descricao]       
                                    )

            
       
        res.status(200).send(newImovel.rows[0])

    }catch(err){
        console.log(tipo)
        console.log(descricao)
        console.error(err.message)
    }
})


app.post('/cadLocatario', async (res,req)=>{
    try{
        const addLoc = await pool.query('',)
    }catch{

    }
})

app.post('/cadLocador', async (res,req)=>{
    try{
        const addLoc = await pool.query('',)
    }catch{

    }
})

/*Notas e avaliação*/
app.post('/cadNotas', async (res,req)=>{
    try{
        const addLoc = await pool.query('',)
    }catch{

    }
})







// Listagem das queries

app.get('/casa',async (req,res)=>{
    try{
        const view = await pool.query('select * from listaCasa;')

        res.json(view.rows)
    }catch(error){
        console.log(error.message)
    }
   

})

app.get('/aps',async (req,res)=>{
    try{
        const view = await pool.query('select * from listaAP;')

        res.json(view.rows)
    }catch(error){
        console.log(error.message)
    }
   

})

app.get('/buscaLocador/:nome',async (req,res)=>{
    try{
        const {nome} = req.params;
        const locad = await pool.query('select * FROM buscaLocador($1);',[nome])

        res.json(locad.rows)
        console.log(nome)
        
    }catch(error){
        console.log(error.message)
    }
})


app.get('/bairrosBaratos', async(req,res)=>{
    try{
        const view = await pool.query('select * from bairrosBaratos;')

        res.json(view.rows)
    }catch(error){
        console.log(error.message)
    }
})


app.get('/bairrosCaros', async(req,res)=>{
    try{
        const view = await pool.query('select * from bairrosCaros;')

        res.json(view.rows)
    }catch(error){
        console.log(error.message)
    }
})