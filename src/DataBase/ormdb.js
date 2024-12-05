const { Sequelize } = require("sequelize");
const { HOST, dbUSER, DB, PASSWORD, POOL} = require("./db.config");
// Connection parameters
console.log(HOST, dbUSER, DB, PASSWORD, POOL);
const sequelize = new Sequelize("marketing", "root",PASSWORD, {
  host: HOST,
  dialect:"mysql",
  pool: POOL,
});
// with URI
//const sequelize = new Sequelize(process.env.POSTGRESQL_DB_URI)

const testDbConnection = async () => {
  try {
    await sequelize.authenticate();
    console.log("Connection has been established successfully.");
  } catch (error) {
    console.error("Unable to connect to the database:", error);
  }
};
module.exports = { sq: sequelize, testDbConnection };
