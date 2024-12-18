const { sq } = require("../../DataBase/ormdb");
const { DataTypes } = require("sequelize");
const { SalesManMaster } = require("./SalesManMaster.Model");
const { zone_masters } = require("./ZoneMaster.Model");


const Salesman_zoneDetail=sq.define("salesman_zone_details", {
    ID: { type: DataTypes.BIGINT, primaryKey: true, allowNull: false,autoIncrement:true },
    ID_Salesman:{
        type:DataTypes.BIGINT,
        allowNull:false
    },
    ID_Zone:{
        type:DataTypes.BIGINT,
        allowNull:false 
    }
    
  });
  

  Salesman_zoneDetail.belongsTo(SalesManMaster,{
    foreignKey:"ID_Salesman",
    targetKey:"ID",
    as:"szd"
  })

  Salesman_zoneDetail.belongsTo(zone_masters,{
    foreignKey:"ID_Zone",
    targetKey:"ID",
    as:"szu"
  })
  // Sync the model with the database
  sq.sync()
    .then(() => {
      console.log("Table created successfully!");
    })
    .catch((err) => {
      console.error("Error creating table:", err);
    });

    module.exports = { Salesman_zoneDetail };