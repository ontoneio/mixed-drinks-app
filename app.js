const express = require('express')
const logger = require('morgan');
var bodyParser = require('body-parser');

const app = express()
const promise = require('bluebird');

const options = {
  // Initialization Options
  promiseLib: promise
};

const pgp = require('pg-promise')(options);
const connectionString = 'postgres://localhost:5432/mixed-drinks';
const db = pgp(connectionString);

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(logger('dev'))
app.set('view engine', 'ejs')

app.get(`/`, (req, res) => {
    res.render('index.ejs')
  })

app.get(`/cocktails`, (req, res, next) => {
  db.any('select * from cocktails')
    .then(function (data) {
      console.log(data);
      res.status(200)
        .json(data);
    })
    .catch(function (err) {
      return next(err);
    });
  })

app.get(`/ingredients`, (req, res, next) => {
  db.any('select * from ingredients')
    .then(function (data) {
      console.log(data);
      res.status(200)
        .json(data);
    })
    .catch(function (err) {
      return next(err);
    });
  })

app.post(`/ingredients/add`, (req, res, next) => {
  // console.log(req.body);
  db.none(`insert into ingredients(ingredient_name) values($1)`, [req.body.ingredient_name])
    .then(function () {
      res.status(200)
        .json({
          status: 'success',
          message: 'Ingredient successfully added.'
        });
    })
    .catch(function (err) {
      return next(err);
    });
})

app.listen(3000, () => {
  console.log(`Listening for Libations on port 3000! `);
})
