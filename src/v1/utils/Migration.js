const { sq } = require("../../DataBase/ormdb");
const xlsx = require("xlsx");
const path = require("path");
const moment = require("moment");
const { Area_Masters } = require("../Model/AreaMaster.Model");
const {customer_masters} =require("../Model/CustomerMaster.Model")

const ImportAreaMasterData = () => {
  const currentDate = moment().format("YYYY-MM-DD");

  // Load Excel file
  const workbook = xlsx.readFile(path.resolve(__dirname, "area_masters1.xlsx"));
  const workbook1 = xlsx.readFile(path.resolve(__dirname, "customer_masters.xlsx"));
  const sheetName = workbook.SheetNames[0]; // Change index if the sheet is different
  const sheetName1 = workbook.SheetNames[0];
  const sheet = workbook.Sheets[sheetName];
  const sheet1 = workbook.Sheets[sheetName1];
  const data = xlsx.utils.sheet_to_json(sheet, { raw: false });
  const data1 = xlsx.utils.sheet_to_json(sheet1, { raw: false });

//   console.log(`Processing data from sheet: ${sheetName}`);
//   console.log(data);

  // Format data to match the area_masters model
  const records = data1.map(async(record) => {
    const areadetails= await Area_Masters.findAll({
        where:{
          Code:record?.Area
        }
    })
    return {
        id_area: areadetails?.ID || -1,
        CoName: record?.CoName || null,
        Address: record?.Address || null,
        Contact_Name: record?.Contact_Name || null,
        othday: record?.othday || null,
        othsttime: record?.othsttime || null,
        othentime: record?.othentime || null,
        half: parseInt(record?.half, 10) || 0,
        full: parseInt(record?.full, 10) || 0,
        Zone_ID: parseInt(record?.Zone_ID, 10) || null,
        CompanyCode:"NSPL"
    };
  });

//   const records1 = data.map((record) => {
//     return {
//         id_area: record?.Code || "default_code",
//         CLSSTATUS: record?.CLSSTATUS || null,
//         daystatus: parseInt(record?.daystatus, 10) || null,
//         daystatus1: record?.daystatus1 || null,
//         othday: record?.othday || null,
//         othsttime: record?.othsttime || null,
//         othentime: record?.othentime || null,
//         half: parseInt(record?.half, 10) || 0,
//         full: parseInt(record?.full, 10) || 0,
//         Zone_ID: parseInt(record?.Zone_ID, 10) || null,
//     };
//   });


  console.log("Formatted records:", records);

  // Insert data into area_masters table
  sq.sync()
    .then(async () => {
      try {
        await customer_masters.bulkCreate(records);
        console.log("Data successfully inserted into area_masters!");
      } catch (err) {
        console.error("Error inserting data:", err);
      }
    })
    .catch((err) => {
      console.error("Error syncing database:", err);
    });


};

ImportAreaMasterData();
