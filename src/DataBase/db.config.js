require("dotenv").config({ path: "../../.env" });
module.exports = {
  HOST: process.env.HOST,
  dbUSER:process.env.dbUSER,
  PASSWORD: process.env.PASSWORD,
  DB: process.env.DB,
  POOL: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000,
  },
};
