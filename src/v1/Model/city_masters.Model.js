const { sq } = require("../../DataBase/ormdb");
// const { v4: uuidv4 } = require("uuid");
// uuidv4();
const {  DataTypes} = require("sequelize");
const { state_masters } = require("./state_masters.Model");
// const { zone_masters } = require("./ZoneMaster.Model");
// const { zone_masters } = require("./ZoneMaster.Model");
console.log("tarasish",state_masters)
const city_masters = sq.define("city_masters", {
  ID: { type: DataTypes.BIGINT, primaryKey: true, allowNull: false,autoIncrement:true },
  NAME: { type: DataTypes.STRING, allowNull: false },
  id_state: {
    type: DataTypes.BIGINT,
    references: {
      model: "state_masters", // Ensure this model name matches exactly
      key: "ID",
    },
  },
});

sq.sync().then(() => {
  console.log("Table created successfully!",state_masters);
});

//  relationship 
city_masters.belongsTo(state_masters,{
  foreignKey:"id_state",
  targetKey:"ID",
  as:"sm"
})

// city_masters.hasMany(zone_masters,{
//   foreignKey:"id_city",
//   sourceKey:"ID",
//   as:"Zones"
// })
module.exports = { city_masters };
