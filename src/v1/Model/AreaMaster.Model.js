const { sq } = require("../../DataBase/ormdb");
const { v4: uuidv4 } = require("uuid");
uuidv4();
const { sequelize, DataTypes, UUID, UUIDV4 } = require("sequelize");
const { zone_masters } = require("./ZoneMaster.Model");
const Area_Masters = sq.define("area_masters", {
  ID: {
    type: DataTypes.BIGINT,
    primaryKey: true,
    allowNull: false,
    autoIncrement: true,
  },
  Code: { type: DataTypes.STRING, allowNull: false },
  CLSSTATUS: { type: DataTypes.STRING, allowNull: true },
  daystatus: { type: DataTypes.BIGINT, allowNull: true },
  daystatus1: { type: DataTypes.STRING, allowNull: true },
  othday: { type: DataTypes.STRING, allowNull: true },
  othsttime: { type: DataTypes.STRING, allowNull: true },
  othentime: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  half: { type: DataTypes.TINYINT },
  full: { type: DataTypes.TINYINT },
  Zone_ID:{
    type:DataTypes.BIGINT,
    references:{
      model:"zone_masters",
      key:"ID"
    }
  },
  // CompanyCode: {
  //   type: DataTypes.STRING,
  //   allowNull: true,
  //   references: {
  //     model: "companymasters",
  //     key: "CompanyCode",
  //   },
  // }, 
});

Area_Masters.belongsTo(zone_masters,
  {
    foreignKey:"Zone_ID",
    targetKey:"ID",
    as:"zm"
  }
)
sq.sync()
  .then(() => {
    console.log("Table created successfully!");
  })
  .catch((err) => {
    console.error("Error creating table:", err);
  });

module.exports = { Area_Masters };
