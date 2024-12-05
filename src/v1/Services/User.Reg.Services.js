const { sq } = require("../../DataBase/ormdb");
const { QueryTypes } = require("sequelize");
const { UserMasters } = require("../Model/UserMaster.Model");

const { v4: uuidv4 } = require("uuid");
const bcrypt = require("bcryptjs");
const { response } = require("express");

const Pwd = bcrypt.genSaltSync(10);
class UserRegService {
  async UserReg(req, res, next) {
    console.log(req.body, "request agent reg");

    let flag = 0;
    let msg = "";

    try {
      const EmailId = req.body.EmailId || null;
      const Name = req.body.UserName;
      const Phonenumber = req.body.Phonenumber;
      const Utype = req.body.Utype;
      const CompanyCode = req.body.CompanyCode;
      const uuid = uuidv4();
      const password = req.body.password;
      const hashPassword = bcrypt.hashSync(password, Pwd);
      const LoginCode=req.body.LoginCode;
      const ZoneId=req.body.ZoneId;
      await sq.sync();

      const companyResult = await UserMasters.findAll({
        where: { LoginCode:LoginCode,
          Pass:password
         },
      });
      if (companyResult.length === 0) {
        msg += "Unauthorized Request!! ";
        flag = 1;
      } else {
        const userResult = await UserMasters.findAll({
          where: { PhoneNumber: Phonenumber },
        });
        if (userResult.length > 0) {
          msg += "Already Registered ";
          flag = 1;
        } else {
          try {
            await UserMasters.create({
              UUid: uuid,
              Eamil: EmailId,
              PhoneNumber: Phonenumber,
              Password: hashPassword,
              Pass:password,
              LoginCode:LoginCode,
              Name,
              CompanyCode,
              Utype,
              EndDate,
              Active,
              ZoneId:ZoneId
            });
            msg += "Registration successful ";
          } catch (err) {
            msg += "Registration failed. " + err;
            flag = 1;
          }
        }
      }

      if (flag === 1) {
        return res.status(400).json({ response: msg.trim() });
      } else {
        return res.status(201).json({ response: "Registration successful" });
      }
    } catch (error) {
      console.error(error);
      return res
        .status(500)
        .json({ response: "Server error: " + error.message });
    }
  }
  async UserEdit(req, res, next) {
    console.log(req.body, "request agent reg");

    let flag = 0;
    let msg = "";

    try {
      const EmailId = req.body.EmailId || null;
      const Name = req.body.UserName;
      const Phonenumber = req.body.Phonenumber;
      const Utype = req.body.Utype;
      const CompanyCode = req.body.CompanyCode;
      const uuid = uuidv4();
      const password = req.body.password;
      const hashPassword = bcrypt.hashSync(password, Pwd);
      const LoginCode=req.body.LoginCode;
      const UUid=req.body.UUid;
      await sq.sync();

      const companyResult = await UserMasters.findAll({
        where: { CompanyCode },
      });
      if (companyResult.length === 0) {
        msg += "Unauthorized Request!! ";
        flag = 1;
      } else {
        const userResult = await UserMasters.findAll({
          where: { LoginCode:LoginCode,
            Pass:password },
        });
        if (userResult.length == 0) {
          msg += "No such User ";
          flag = 1;
        } else {
          try {
            await UserMasters.update({
    
              Eamil: EmailId,
              PhoneNumber: Phonenumber,
              Password: hashPassword,
              Pass:password,
              Name,
              EndDate,
              Active
            },{where:{
              UUid:UUid
            }});
            msg += "Registration successful ";
          } catch (err) {
            msg += "Registration failed. " + err;
            flag = 1;
          }
        }
      }

      if (flag === 1) {
        return res.status(400).json({ response: msg.trim() });
      } else {
        return res.status(201).json({ response: "Registration successful" });
      }
    } catch (error) {
      console.error(error);
      return res
        .status(500)
        .json({ response: "Server error: " + error.message });
    }
  }
}
module.exports = new UserRegService();
