const { sq } = require("../../DataBase/ormdb");
const { QueryTypes } = require("sequelize");
const { serial_infos } = require("../Model/SerialInfo.Model");
const {
  Feedback_Transactions,
} = require("../Model/Feedback_Transaction.Model");
const moment = require('moment');
const { v4: uuidv4 } = require("uuid");
const bcrypt = require("bcryptjs");
const { response } = require("express");

const Pwd = bcrypt.genSaltSync(10);
class TransService {
 async  FeedbackTrans(req, res, next) {
  // console.log(req.body, "Received feedback request");

  try {
    // Extracting data from request body
    const {
      Id_Name: ID_Customer, // Alias for clarity
      Custstatus,
      Actiondate,
      CompanyCode,
      remarks,
      ID_USER,
    } = req.body;
    console.log(req.body)
    // console.log(CompanyCode);
    // Generate current date for Voudate
    const Voudate = moment().format("YYYY-MM-DD");
    const TRANCODE = "FST"; // Transaction code

    // Ensure database schema is synced
    await sq.sync();

    // Retrieve the last serial number for the transaction code and company
    const lastSerial = await serial_infos.findOne({
      attributes: ["LASTSERIAL"],
      where: { TRANCODE, CompanyCode },
    });

    if (!lastSerial) {
      return res.status(404).json({
        errMsg: true,
        response: "Transaction code or company code not found.",
      });
    }

    const srl = lastSerial.LASTSERIAL + 1;
    const VOUNO = `${TRANCODE}${srl}`; // Generate unique voucher number

    // Insert feedback transaction record
    const feedback = await Feedback_Transactions.create({
      Vounum: VOUNO,
      Voudate,
      ID_Customer,
      Cust_Status: Custstatus,
      Actiondate,
      Remarks: remarks,
      ID_USER,
      CompanyCode: CompanyCode,
    });
console.log(feedback);
console.log(feedback.CompanyCode);
    // Update last serial number
    await serial_infos.update(
      { LASTSERIAL: srl },
      { where: { TRANCODE } }
    );

    // Return success response
    return res.status(200).json({
      errMsg: false,
      response: "Feedback added successfully",
      data: feedback,
    });
  } catch (error) {
    console.error("Feedback transaction error:", error.message);
    return res.status(500).json({
      errMsg: true,
      response: `Server error: ${error.message}`,
    });
  }
}

  async FeedbackList(req, res, next) {
    console.log(req.body, "request agent reg");

    let flag = 0;
    let msg = "";

    try {
      const Voudate = req.body.Voudate || null;
      const Id_Name = req.body.Id_Name;
      const Custstatus = req.body.Custstatus;
      const Actiondate = req.body.Actiondate;
      const CompanyCode = req.body.CompanyCode;
      const STATUS = req.body.STATUS;
      const remarks = req.body.remarks;
      const STATUS1 = req.body.STATUS1;
      const ID_USER = req.body.ID_USER;
      const TRANCODE = req.body.TRANCODE;
      await sq.sync();

      await Feedback_Transactions.findAll().then(async (Result) => {
        if (Result.length != 0) {
          return res.status(200).json({ errMsg: false, response: Result });
        } else {
          return res.status(400).json({ errMsg: false, response: Result });
        }
      });
    } catch (error) {
      console.error(error);
      return res
        .status(500)
        .json({ response: "Server error: " + error.message });
    }
  }
  async TrackAdd(req, res, next) {
    console.log(req.body, "request agent reg");

    let flag = 0;
    let msg = "";

    try {
      const DateTime = req.body.DateTime || null;
      const Userid = req.body.Userid;
      const ZoneID = req.body.ZoneID;
      const Coordinates = req.body.Coordinates;
      const CompanyCode = req.body.CompanyCode;
      const Address = req.body.Address;

      await sq.sync();



      await tracking_masters.create({
        DateTime: DateTime,
        Userid: Userid,
        ZoneID: ZoneID,
        Coordinates: Coordinates,
        Address: Address,
        CompanyCode: CompanyCode,
      })
      .then(async(RegRes) => {
        return res.status(200).json({
          errMsg: false,
          response: "Submitted Successfully",
        });
      })
      .catch((err) => {
        console.log(err);
        return res.status(500).json({
          errMsg: false,
          Response: "Submisson failed." + err,
        });
      });

        
      

    } catch (error) {
      console.error(error);
      return res
        .status(500)
        .json({ response: "Server error: " + error.message });
    }
  }
}
module.exports = new TransService();
