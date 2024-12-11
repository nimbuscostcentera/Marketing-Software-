const { sq } = require("../../DataBase/ormdb");
const { DataTypes } = require("sequelize");

// Define the AccountMaster model
const  State_Details_Master= sq.define("state_details_master", {
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
    }
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
