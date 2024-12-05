const { sq } = require("../../DataBase/ormdb");
const { DataTypes,Model, Sequelize } = require("sequelize");
// const { city_masters } = require("./city_masters.Model");
const {city_masters} =require("./city_masters.Model")

// Define the AccountMaster model
// console.log(city_masters,"tarasish.state")
const zone_masters = sq.define("zone_masters", {
  ID: { type: DataTypes.BIGINT, primaryKey: true, allowNull: false,autoIncrement:true },
  NAME: { type: DataTypes.STRING, allowNull: false },
  Parent_zone: { type: DataTypes.BIGINT },
  id_city: {
    type: DataTypes.BIGINT,
    references: {
      model: "city_masters",
      key: "ID",
    },
  },
});

// Sync the model with the database
sq.sync()
  .then(() => {
    console.log("zone master successful!");

    console.log( city_masters,"nemo"); // Should print: true
//console.log(city_masters instanceof sq.Model,"lemo"); // Should print: true

  })
  .catch((err) => {
    console.error("Error creating table:", err);
  });

  // relationship 
  zone_masters.belongsTo(city_masters,{
    foreignKey:"id_city",
    targetKey:"ID",
    as:"cm"
  })

module.exports = { zone_masters };
