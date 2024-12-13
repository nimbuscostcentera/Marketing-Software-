const { sq } = require("../../DataBase/ormdb");
const { v4: uuidv4 } = require("uuid");
uuidv4();
const { sequelize, DataTypes, UUID, UUIDV4 } = require("sequelize");
const { customer_masters } = require("./CustomerMaster.Model");
const { CustomerType_Master } = require("./CustomerTypeMaster.Model");
const { FBType_Masters } = require("./FBType.Model");
const Feedback_Transactions = sq.define("feedback_transactions", {
  ID: {
    type: DataTypes.BIGINT,
    primaryKey: true,
    autoIncrement: true,
    allowNull: false,
  },
  Vounum: {
    type: DataTypes.STRING,
    allowNull: false,
    unique:true
  },
  Voudate: {
    type: DataTypes.DATEONLY,
    allowNull: false,
  },
  ID_Customer: {
    type: DataTypes.BIGINT,
    allowNull: false,
    references: {
      model: "customer_masters",
      key: "ID",
    },
  },
  Cust_Status: {
    type: DataTypes.BIGINT,
    allowNull: true,
    references: {
      model: "FBType_Masters",
      key: "ID",
    },
  },
  Actiondate: {
    type: DataTypes.DATEONLY,
    allowNull: false,
  },
  // STATUS: {
  //   type: DataTypes.TINYINT,
  //   allowNull: false,
  // },
  Remarks: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  ID_USER: {
    type: DataTypes.BIGINT,
    allowNull: false,
    references: {
      model: "usermasters",
      key: "ID",
    }
  },
  CompanyCode: {
    type: DataTypes.STRING,
    allowNull: false,
    references: {
      model: "companymasters",
      key: "CompanyCode",
    },
  }
});

Feedback_Transactions.belongsTo(customer_masters, {
  foreignKey: "ID_Customer",
  targetKey: "ID",
  as: "cust"
});
Feedback_Transactions.belongsTo(FBType_Masters, {
  foreignKey: "Cust_Status",
  targetKey: "ID",
  as: "ftm",
});

sq.sync()
  .then(() => {
    console.log("Table created successfully!");
  })
  .catch((err) => {
    console.error("Error creating table:", err);
  });

module.exports = { Feedback_Transactions };
