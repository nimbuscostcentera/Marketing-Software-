const { sq } = require("../../DataBase/ormdb");
const { DataTypes } = require("sequelize");

// Define the Week_Masters model
const Week_Masters = sq.define("week_masters", {
  ID: { type: DataTypes.BIGINT, primaryKey: true, allowNull: false, autoIncrement: true },
  type_name: { type: DataTypes.STRING, allowNull: false },
});

// Function to sync the model and add weekdays
async function createWeekdays() {
  try {
    // Sync the model
    await sq.sync();

    // // Array of weekdays
    // const weekdays = [
    //   { type_name: "Monday" },
    //   { type_name: "Tuesday" },
    //   { type_name: "Wednesday" },
    //   { type_name: "Thursday" },
    //   { type_name: "Friday" },
    //   { type_name: "Saturday" },
    //   { type_name: "Sunday" },
    // ];

    // // Insert weekdays using bulkCreate
    // await Week_Masters.bulkCreate(weekdays);

    console.log("Weekdays added successfully!");
  } catch (err) {
    console.error("Error creating table or adding weekdays:", err);
  }
}

// Call the function
createWeekdays();

module.exports = { Week_Masters };
