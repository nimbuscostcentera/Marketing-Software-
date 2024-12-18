const { sq } = require("../../DataBase/ormdb");
const { DataTypes } = require("sequelize");
const { SalesManMaster } = require("./SalesManMaster.Model");
const { city_masters } = require("./city_masters.Model");


const Salesman_cityDetail=sq.define("salesman_city_details", {
    ID: { type: DataTypes.BIGINT, primaryKey: true, allowNull: false,autoIncrement:true },
    ID_Salesman:{
        type:DataTypes.BIGINT,
        allowNull:false
    },
    ID_City:{
        type:DataTypes.BIGINT,
        allowNull:false 
    }
    
  });
  

  Salesman_cityDetail.belongsTo(SalesManMaster,{
    foreignKey:"ID_Salesman",
    targetKey:"ID",
    as:"sd"
  })

  Salesman_cityDetail.belongsTo(city_masters,{
    foreignKey:"ID_City",
    targetKey:"ID",
    as:"scd"
  })
  // Sync the model with the database
  sq.sync()
    .then(() => {
      console.log("Table created successfully!");
    })
    .catch((err) => {
      console.error("Error creating table:", err);
    });

    module.exports = { Salesman_cityDetail };