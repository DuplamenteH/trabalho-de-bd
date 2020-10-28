const Pool = require('pg').Pool

const pool = new Pool({
    user: 'postgres',
    password : '2209nescau',
    host : 'localhost',
    port : 5432,
    database : 'trabalhoBD'
})


module.exports = pool;