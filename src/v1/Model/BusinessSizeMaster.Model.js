const { DataTypes } = require("sequelize");
const { sq } = require("../../DataBase/ormdb");


const business_Master=sq.define("business_masters",{
    ID:{type:DataTypes.BIGINT, primaryKey:true, allowNull:false,autoIncrement:true},
    description:{ type:DataTypes.STRING , allowNull:false},
    code:{ type:DataTypes.STRING , allowNull:false}
})


async function createbusiness(){
    try {
        await sq.sync()

        // const businessSize=[
        //     {description:"Large",code:"A"},
        //     {description:"Medium",code:"B"},
        //     {description:"Small",code:"C"}
        // ]

        // await business_Master.bulkCreate(businessSize)
        console.log("business size created")
    } catch (error) {
        console.log("error in creating business size",err)
    }
}
createbusiness()

module.exports={business_Master}