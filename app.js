const express = require('express')
const logger = require('morgan');

const app = express()


app.use(logger('dev'))
app.set('view engine', 'ejs')

app.get(`/`, (req, res) => {
    res.render('index.ejs')
  })


app.listen(3000, () => {
  console.log(`Listening for Libations on port 3000! `);
})