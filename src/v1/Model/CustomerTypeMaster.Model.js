const { DataTypes } = require("sequelize");
const { sq } = require("../../DataBase/ormdb");


const CustomerType_Master=sq.define("cust_type_masters",{
    ID:{type:DataTypes.BIGINT, primaryKey:true, allowNull:false, autoIncrement:true},
    type:{type:DataTypes.STRING, allowNull:false}
})



sq.sync()
  .then(() => {
    console.log("Table created successfully!");
  })
  .catch((err) => {
    console.error("Error creating table:", err);
  });

module.exports = { CustomerType_Master };