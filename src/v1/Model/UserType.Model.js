const { sq } = require("../../DataBase/ormdb");
const { DataTypes } = require("sequelize");

// Define the Week_Masters model
const User_Type_Masters = sq.define("User_Type_Masters", {
  ID: {
    type: DataTypes.BIGINT,
    primaryKey: true,
    allowNull: false,
    autoIncrement: true,
  },
  description: { type: DataTypes.STRING, allowNull: false },
  is_salesman: {
    type: DataTypes.TINYINT,
    allowNull: false,
  },
  is_area: {
    type: DataTypes.TINYINT,
    allowNull: false,
  },
  is_companyreg: {
    type: DataTypes.TINYINT,
    allowNull: false,
  },
  is_location: {
    type: DataTypes.TINYINT,
    allowNull: false,
  },
});

// Function to sync the model and add weekdays
async function createUserWeekdays() {
  try {
    // Sync the model
    await sq.sync();

    // // // Array of weekdays
    // const weekdays = [
    //   { description: "All Country" },
    //   { description: "One own country" },
    //   { description: "Some State" },
    //   { description: "Only Individual" },
    // ];

    // // Insert weekdays using bulkCreate
    // await User_Type_Masters.bulkCreate(weekdays);

    console.log("User Type added successfully!");
  } catch (err) {
    console.error("Error creating table or adding User Type:", err);
  }
}

// Call the function
createUserWeekdays();

module.exports = { User_Type_Masters };
