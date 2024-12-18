const { sq } = require("../../DataBase/ormdb");
const { DataTypes } = require("sequelize");
const { SalesManMaster } = require("./SalesManMaster.Model");
const { city_masters } = require("./city_masters.Model");
const { Area_Masters } = require("./AreaMaster.Model");


const Salesman_areadetails=sq.define("salesman_area_details", {
    ID: { type: DataTypes.BIGINT, primaryKey: true, allowNull: false,autoIncrement:true },
    ID_Salesman:{
        type:DataTypes.BIGINT,
        allowNull:false
    },
    ID_Area:{
        type:DataTypes.BIGINT,
        allowNull:false 
    }
    
  });
  

  Salesman_areadetails.belongsTo(SalesManMaster,{
    foreignKey:"ID_Salesman",
    targetKey:"ID",
    as:"sd"
  })

  Salesman_areadetails.hasMany(Area_Masters,{
    foreignKey:"ID_Area",
    targetKey:"ID",
    as:"areasalesman"
  })
  // Sync the model with the database
  sq.sync()
    .then(() => {
      console.log("Table created successfully!");
    })
    .catch((err) => {
      console.error("Error creating table:", err);
    });

    module.exports = { Salesman_areadetails };