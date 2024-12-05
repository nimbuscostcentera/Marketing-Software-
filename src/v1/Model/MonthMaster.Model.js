const { DataTypes } = require("sequelize");
const { sq } = require("../../DataBase/ormdb");

const month_Master=sq.define("month_masters",{
    ID:{type:DataTypes.BIGINT, primaryKey:true, allowNull:false, autoIncrement:true},
    MonthName:{type:DataTypes.STRING, allowNull:false},
    MonthCode:{ type:DataTypes.STRING,allowNull:false}
})

async function createMonth(){
    try {
        await sq.sync();

    // const monthsList=[
    //     {MonthName:"January",MonthCode:"JAN"},
    //     {MonthName:"February",MonthCode:"FEB"},
    //     {MonthName:"March",MonthCode:"MAR"},
    //     {MonthName:"April",MonthCode:"APR"},
    //     {MonthName:"May",MonthCode:"MAY"},
    //     {MonthName:"June",MonthCode:"JUN"},
    //     {MonthName:"July",MonthCode:"JUL"},
    //     {MonthName:"August",MonthCode:"AUG"},
    //     {MonthName:"September",MonthCode:"SEP"},
    //     {MonthName:"October",MonthCode:"OCT"},
    //     {MonthName:"November",MonthCode:"NOV"},
    //     {MonthName:"December",MonthCode:"DEC"}
    // ]
    // await month_Master.bulkCreate(monthsList)
    // console.log("Monthlist created successly")
    } catch (error) {
        console.log("Error in createing monthlist",err)
    }
}
createMonth()

module.exports = { month_Master };