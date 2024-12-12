const { sq } = require("../../DataBase/ormdb");
const { DataTypes } = require("sequelize");
const { country_masters } = require("./CountryMaster.Model");
const { state_masters } = require("./state_masters.Model");
const { UserMasters } = require("./UserMaster.Model");
// Define the AccountMaster model
const State_Details_Master = sq.define("state_details_master", {
  ID: {
    type: DataTypes.BIGINT,
    primaryKey: true,
    allowNull: false,
    autoIncrement: true,
  },
  id_state: {
    type: DataTypes.BIGINT,
    allowNull: false,
    references: {
      model: "state_masters",
      key: "ID",
    },
  },
  id_user: {
    type: DataTypes.BIGINT,
    allowNull: false,
    references: {
      model: "usermasters",
      key: "ID",
    },
  },
  id_country: {
    type: DataTypes.BIGINT,
    allowNull: false,
    references: {
      model: "country_masters",
      key: "ID",
    },
  },
});

State_Details_Master.belongsTo(country_masters, {
  foreignKey: "id_country",
  targetKey: "ID",
  as: "state_scountry_relation",
});

State_Details_Master.belongsTo(state_masters, {
  foreignKey: "id_state",
  targetKey: "ID",
  as: "statedetails",
});
State_Details_Master.belongsTo(UserMasters, {
  foreignKey: "id_user",
  targetKey: "ID",
  as: "userstate",
});

// Sync the model with the database
sq.sync()
  .then(() => {
    console.log("Table created successfully!");
  })
  .catch((err) => {
    console.error("Error creating table:", err);
  });

// Establist relationship with country and state

// country_masters.hasMany(state_masters ,{
//   foreignKey:"id_country",
//   sourceKey:"ID",
//   as:"States"
// })

module.exports = { State_Details_Master };
