const pgp = require('pg-promise')();

const connection = process.env.NODE_ENV === 'test'
  ? 'postgres:///mixed-drinks'
  : 'postgres:///mixed-drinks';

const db = pgp(connection);

module.exports = { db };
