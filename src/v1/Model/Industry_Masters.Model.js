const { sq } = require("../../DataBase/ormdb");
const { DataTypes } = require("sequelize");

// Define the AccountMaster model
const Industry_Masters = sq.define("industry_masters", {
  ID: {
    type: DataTypes.BIGINT,
    primaryKey: true,
    allowNull: false,
    autoIncrement: true,
  },
  NAME: { type: DataTypes.STRING, allowNull: false },
});

// Sync the model with the database
sq.sync()
  .then(() => {
    console.log("Table created successfully!");
  })
  .catch((err) => {
    console.error("Error creating table:", err);
  });

module.exports = { Industry_Masters };
