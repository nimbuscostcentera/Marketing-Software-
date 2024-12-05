const { DataTypes } = require("sequelize");
const { sq } = require("../../DataBase/ormdb");



const year_Master= sq.define("year_masters",{
    ID:{type:DataTypes.BIGINT, primaryKey:true, allowNull:false, autoIncrement:true},
    Session:{ type:DataTypes.STRING, allowNull:false},
    startDate:{ type:DataTypes.DATE, allowNull:false},
    endDate: {type:DataTypes.DATE, allowNull:false},
    status:{type:DataTypes.INTEGER , allowNull:false, defaultValue:0}
})

sq.sync()
  .then(() => {
    console.log("Table created successfully!");
  })
  .catch((err) => {
    console.error("Error creating table:", err);
  });

module.exports={year_Master}