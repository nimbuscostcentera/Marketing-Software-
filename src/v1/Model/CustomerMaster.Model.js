const { sq } = require("../../DataBase/ormdb");
const { DataTypes } = require("sequelize");
const { country_masters } = require("./CountryMaster.Model");
const { state_masters } = require("./state_masters.Model");
const { city_masters } = require("./city_masters.Model");
const { Area_Masters } = require("./AreaMaster.Model");
const { Industry_Masters } = require("./Industry_Masters.Model");
const { SalesManMaster } = require("./SalesManMaster.Model");
const { business_Master } = require("./BusinessSizeMaster.Model");

// Define the CustomerMaster model
const customer_masters = sq.define("customer_masters", {
  ID: {
    type: DataTypes.BIGINT,
    autoIncrement: true,
    primaryKey: true,
    allowNull: false,
  },
  CoName: { type: DataTypes.STRING, allowNull: false },
  PhNo: { type: DataTypes.BIGINT, allowNull: true },
  Mobile: { type: DataTypes.BIGINT, allowNull: true },
  PinCode: { type: DataTypes.BIGINT, allowNull: true },
  Contact_Name: { type: DataTypes.STRING, allowNull: true },
  ADDRESS: { type: DataTypes.STRING, allowNull: true },
  Remarks: { type: DataTypes.STRING, allowNull: true },
  id_area: {
    type: DataTypes.BIGINT,
    allowNull: false,
    references: {
      model: "Area_Masters", // Ensure this model name matches exactly
      key: "ID",
    },
  },
  id_state: {
    type: DataTypes.BIGINT,
    allowNull: false,
    references: {
      model: "state_masters",
      key: "ID",
    },
  },
  id_city: {
    type: DataTypes.BIGINT,
    allowNull: false,
    references: {
      model: "city_masters",
      key: "ID",
    },
  },
  CompanyCode: {
    type: DataTypes.STRING,
    allowNull: false,
    references: {
      model: "companymasters",
      key: "CompanyCode",
    },
  },
  // STATUS:{
  //   type: DataTypes.TINYINT
  // },
  REFNAME: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  ID_Industry: {
    type: DataTypes.BIGINT,
    allowNull: true,
  },
  ID_Salesman: {
    type: DataTypes.BIGINT,
    allowNull: true,
  },
  ID_Country: {
    type: DataTypes.BIGINT,
    allowNull: true,
  },
  Busi_size: {
    type: DataTypes.BIGINT,
    allowNull: true,
  },
});


customer_masters.belongsTo(country_masters, {
  foreignKey: "ID_Country",
  targetKey: "ID",
  as: "con",
});
customer_masters.belongsTo(state_masters, {
  foreignKey: "id_state",
  targetKey: "ID",
  as: "sm",
});
customer_masters.belongsTo(city_masters, {
  foreignKey: "id_city",
  targetKey: "ID",
  as: "cm",
});
customer_masters.belongsTo(Area_Masters, {
  foreignKey: "id_area",
  targetKey: "ID",
  as: "am",
});
customer_masters.belongsTo(Industry_Masters, {
  foreignKey: "ID_Industry",
  targetKey: "ID",
  as: "im",
});
customer_masters.belongsTo(SalesManMaster, {
  foreignKey: "ID_Salesman",
  targetKey: "ID",
  as: "sales",
});
customer_masters.belongsTo(business_Master, {
  foreignKey: "Busi_size",
  targetKey: "ID",
  as: "bsm",
});
// Sync the model with the database
sq.sync()
  .then(() => {
    console.log("CustomerMaster table created successfully!");
  })
  .catch((err) => {
    console.error("Error creating CustomerMaster table:", err);
  });

module.exports = { customer_masters };