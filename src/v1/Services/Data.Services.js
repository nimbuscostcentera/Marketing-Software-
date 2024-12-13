const { sq } = require("../../DataBase/ormdb");
const { User_Type_Masters } = require("../Model/UserType.Model");
const { Area_Masters } = require("../Model/AreaMaster.Model");
const { Vendor_Masters } = require("../Model/Vendor_Master.Model");
const { city_masters } = require("../Model/city_masters.Model");
const { state_masters } = require("../Model/state_masters.Model");
const { zone_masters } = require("../Model/ZoneMaster.Model");
const { SalesManMaster } = require("../Model/SalesManMaster.Model");
const { CompanyMasters } = require("../Model/CompanyMaster.Model");
const { country_masters } = require("../Model/CountryMaster.Model");
const { FBType_Masters } = require("../Model/FBType.Model");
const { Week_Masters } = require("../Model/WeekMaster.Model");
const { Op, literal } = require("sequelize");
const { QueryTypes } = require("sequelize");
const { Industry_Masters } = require("../Model/Industry_Masters.Model");
const { business_Master } = require("../Model/BusinessSizeMaster.Model");
const { customer_masters } = require("../Model/CustomerMaster.Model");
const moment = require("moment");
const {
  Feedback_Transactions,
} = require("../Model/Feedback_Transaction.Model");
const { CustomerType_Master } = require("../Model/CustomerTypeMaster.Model");
const { year_Master } = require("../Model/YearMaster.Model");
const { month_Master } = require("../Model/MonthMaster.Model");
const { State_Details_Master } = require("../Model/state_detailsMaster.Model");
class Dataservice {
  async AreaList(req, res, next) {
    const { CompanyCode, ReportType, Date, zone_id } = req.body;

    let zoneObj = { };
    if (
      zone_id !== undefined &&
      zone_id !== null &&
      zone_id !== "" &&
      zone_id != -1
    ) {
      zoneObj.Zone_ID = zone_id;
    }
    let db6 = await sq
      .sync()
      .then(async () => {
        await Area_Masters.findAll({
          where: zoneObj,
          include: [
            {
              model: zone_masters,
              as: "zm", // Alias for zone_masters
              attributes: [],
              required: true,
              include: [
                {
                  model: city_masters,
                  as: "cm", // Alias for city_masters
                  required: true,
                  include: [
                    {
                      model: state_masters,
                      as: "sm", // Alias for city_masters
                      required: true,
                      attributes: [], // Include as `cm`
                    },
                  ],
                  attributes: [], // Include as `cm`
                },
              ],
            },
          ],
          attributes: [
            "ID",
            ["Code", "AreaCode"],
            [sq.col("zm.NAME"), "Zone"],
            [sq.col("zm->cm.NAME"), "City"],
            [sq.col("zm->cm->sm.State_name"), "State"],
            ["CLSSTATUS", "Remarks"],
            ["othday", "ClosingDay"],
            ["othsttime", "ClosingFrom"],
            ["othentime", "ClosingTill"],
          ],
        })
          .then(async (Result) => {
            if (Result.length != 0) {
              return res.status(200).json({ errMsg: false, response: Result });
            } else {
              return res.status(400).json({ errMsg: false, response: Result });
            }
          })
          .catch((err) => {
            console.log(err);
          });
      })
      .catch((err) => {
        console.log(err);
      });
    return db6;
  }
  async IndustryList(req, res, next) {
    try {
      const { CompanyCode, ReportType, Date } = req.body;

      await Industry_Masters.findAll().then(async (Result) => {
        if (Result.length != 0) {
          return res.status(200).json({ errMsg: false, response: Result });
        } else {
          return res.status(400).json({ errMsg: false, response: Result });
        }
      });

      // const users =  AgentMasters.findAll();
    } catch (error) {
      return res.status(500).json({ status: "FAILED", data: error });
    }
  }
  async CityList(req, res, next) {
    try {
      const { StateCode } = req.body;
      let stateObj = {};
      if (StateCode !== undefined && StateCode !== null && StateCode !== "") {
        stateObj.id_state = StateCode;
      }

      await city_masters
        .findAll({
          where: stateObj,
          include: [
            {
              model: state_masters,
              as: "sm",
              include: [
                {
                  model: country_masters,
                  as: "Country",
                },
              ],
              attributes: [],
            },
          ],
          attributes: [
            "ID",
            "NAME",
            [sq.col("State_name"), "State"],
            [sq.col("Country_name"), "Country"],
          ],
        })
        .then(async (Result) => {
          console.log(Result);
          if (Result.length != 0) {
            return res.status(200).json({ errMsg: false, response: Result });
          } else {
            return res.status(200).json({ errMsg: false, response: Result });
          }
        });

      // const users =  AgentMasters.findAll();
    } catch (error) {
      return res.status(400).json({ status: "FAILED", data: error });
    }
  }
  async StateList(req, res, next) {
    try {
      const { CountryCode } = req.body;
      console.log(CountryCode);
      let data_obj = {};
      let message_obj = {
        warning: false,
        msg: "",
      };
      if (
        CountryCode !== undefined &&
        CountryCode !== null &&
        CountryCode !== ""
      ) {
        data_obj.id_country = parseInt(CountryCode);
      } else {
        (message_obj.warning = true),
          (message_obj.msg = "country code is not defined");
        // return res
        //   .status(400)
        //   .json({ errMsg: false, message: message_obj.msg });
      }
      const user = req.user;
      // console.log(user,"User from req.user")
      let Result;
      if (user.Utype == 3) {
        Result = await State_Details_Master.findAll({
          where: {
            id_user: user.ID,
          },
          include: [
            {
              model: state_masters,
              as: "statedetails",
              attributes: [],
              where: data_obj,
            },
          ],
          attributes: [
            [sq.col("statedetails.ID"), "ID"],
            [sq.col("statedetails.State_name"), "state"],
          ],
          raw: true,
        });
        // console.log(details,"details fetched for utype 3")
      } else {
        Result = await state_masters.findAll({
          where: data_obj,
          include: [
            {
              model: country_masters,
              as: "Country",
              attributes: [],
              // attributes: ["ID",[ sq.col('Country_name'),'Country'] ],
            },
          ],
          attributes: [
            "ID",
            ["State_name", "state"],
            [sq.col("Country.country_name"), "country"],
          ],
          // raw:true
        });
      }

      if (Result.length != 0) {
        // console.log(Result);
        return res.status(200).json({ errMsg: false, response: Result });
      } else {
        return res.status(400).json({ errMsg: false, response: Result });
      }

      // const users =  AgentMasters.findAll();
    } catch (error) {
      console.log(error);
      return res.status(500).json({ status: "FAILED", data: error });
    }
  }
  async AdminPanel(req, res, next) {
    const { CompanyCode, StartDate, EndDate, today, fbtype, Area } = req.body;
    const user = req.user;
    console.log(user);
    let obj = {};
    if (
      StartDate !== "" &&
      StartDate !== undefined &&
      StartDate !== null &&
      EndDate !== "" &&
      EndDate !== undefined &&
      EndDate !== null
    ) {
      obj.Actiondate = {
        [Op.between]: [StartDate, EndDate],
      };
    }
    if (today !== "" && today !== undefined && today !== null && today == 1) {
      obj.Actiondate = moment().format("YYYY-MM-DD");
    }
    if (fbtype !== "" && fbtype !== undefined && fbtype !== null) {
      obj.fbtype = fbtype;
    }
    if (Area !== "" && Area !== undefined && Area !== null) {
      obj.Area = Area;
    }
    if (CompanyCode !== undefined && CompanyCode !== null && CompanyCode !== "" && user?.Utype!=1) {
      obj.CompanyCode = CompanyCode;
    }
   

    let dbconnect = sq
      .sync()
      .then(async () => {
        await Feedback_Transactions.findAll({
          include: [
            {
              model: customer_masters,
              as: "cust",
              required: true,
              attributes: [],
              include: [
                {
                  model: Area_Masters,
                  as: "am",
                  required: true,
                  include: [
                    {
                      model: zone_masters,
                      as: "zm",
                      required: true,
                      attributes: [],
                    },
                  ],
                },
                {
                  model: state_masters,
                  as: "sm",
                  required: true,
                  attributes: [],
                },
                {
                  model: city_masters,
                  as: "cm",
                  required: true,
                  attributes: [],
                },
                {
                  model: country_masters,
                  as: "con",
                  required: true,
                  attributes: [],
                },
                {
                  model: Industry_Masters,
                  as: "im",
                  required: true,
                  attributes: [],
                },
                {
                  model: SalesManMaster,
                  as: "sales",
                  required: true,
                  attributes: [],
                },
                {
                  model: business_Master,
                  as: "bsm",
                  attributes: [],
                  required: true,
                },
              ],
            },
            {
              model: FBType_Masters,
              as: "ftm",
              attributes: [],
              required: true,
            },
          ],
          where: obj,
          attributes: [
            "Vounum",
            "Voudate",
            "remarks",

            "Actiondate",
            "CompanyCode",
            [sq.col("cust.CoName"), "CustomerName"],
            [sq.col("ftm.ID"), "ID_Status"],
            [sq.col("ftm.type_name"), "Cust_Status"],
            [sq.col("cust.mobile"), "mobile"],
            [sq.col("cust->am.Code"), "AreaCode"],
            [sq.col("cust->bsm.description"), "Description"],
            [sq.col("cust->am->zm.NAME"), "Zone"],
            [sq.col("cust->cm.NAME"), "City"],
            [sq.col("cust->sm.State_Name"), "State"],
            [sq.col("cust->con.Country_name"), "Country"],
            [sq.col("cust->im.NAME"), "Industry"],
            [sq.col("cust->sales.NAME"), "SalesMan_Name"],
          ],
        })
          .then(async (resp) => {
            return res.status(200).json({
              errmag: false,
              response: resp,
            });
          })
          .catch((err) => {
            console.log(err);
          });
      })
      .catch((err) => {
        console.log(err);
      });
    return dbconnect;
  }
  async CustomerList(req, res, next) {
    try {
      const { CompanyCode, User_Type } = req.body;
      let obj = {};
      console.log(req.body, "In customer List");
      if (User_Type != 1) {
        obj = {
          where: {
            CompanyCode: CompanyCode,
          },
        };
      }
      // console.log(obj);
      let Result = await customer_masters.findAll(obj);

      return res.status(200).json({ errMsg: false, response: Result });
    } catch (error) {
      console.log(error);
      return res.status(400).json({ status: "FAILED", data: error });
    }
  }
  async SalesmanList(req, res, next) {
    try {
      const { CompanyCode } = req.body;

      await SalesManMaster.findAll({
        where: {
          CompanyCode: CompanyCode,
        },
      }).then(async (Result) => {
        // console.log(Result)
        if (Result.length != 0) {
          return res.status(200).json({ errMsg: false, response: Result });
        } else {
          return res.status(400).json({ errMsg: false, response: Result });
        }
      });
    } catch (error) {
      return res.status(500).json({ status: "FAILED", data: error });
    }
  }
  async CompanyList(req, res, next) {
    try {
      const { CountryCode, User_Type } = req.body;
      let obj = {};
      console.log(req.body, "In company List");

      const country = await country_masters.findOne({
        where: { ID: CountryCode },
      });
      console.log(country);
      const countryName = country?.Country_name;
      if (User_Type != 1) {
        obj = { where: { Country: countryName } };
      }

      await CompanyMasters.findAll(obj).then(async (Result) => {
        if (Result.length != 0) {
          return res.status(200).json({ errMsg: false, response: Result });
        } else {
          return res.status(400).json({ errMsg: false, response: Result });
        }
      });

      // const users =  AgentMasters.findAll();
    } catch (error) {
      console.log(error);
      return res.status(400).json({ status: "FAILED", data: error });
    }
  }
  async zonelist(req, res, next) {
    try {
      const { CityCode } = req.body;
      // console.log(CityCode)
      const cityDataObj = {};
      if (CityCode !== undefined && CityCode !== null && CityCode !== "") {
        cityDataObj.id_city = parseInt(CityCode);
      }
      await zone_masters
        .findAll({
          where: cityDataObj,
        })

        .then(async (Result) => {
          if (Result.length != 0) {
            console.log(Result);
            return res.status(200).json({ errMsg: false, response: Result });
          } else {
            return res.status(400).json({ errMsg: false, response: Result });
          }
        });

      // const users =  AgentMasters.findAll();
    } catch (error) {
      return res.status(500).json({ status: "FAILED", data: error });
    }
  }
  async CountryList(req, res, next) {
    try {
      const { ReportType, Date } = req.body;
      const countryName = req.country;
      console.log("inside country list", countryName);

      if (countryName) {
        const countryDetails = await country_masters.findAll({
          where: { country_name: countryName },
        });
        return res
          .status(200)
          .json({ errMsg: false, response: countryDetails });
      }

      await country_masters.findAll().then(async (Result) => {
        if (Result.length != 0) {
          return res.status(200).json({ errMsg: false, response: Result });
        } else {
          return res.status(400).json({ errMsg: false, response: Result });
        }
      });

      // const users =  AgentMasters.findAll();
    } catch (error) {
      return res.status(500).json({ status: "FAILED", data: error });
    }
  }
  async FBTypeList(req, res, next) {
    try {
      // const { ReportType, Date } = req.body;

      await FBType_Masters.findAll().then(async (Result) => {
        if (Result.length != 0) {
          return res.status(200).json({ errMsg: false, response: Result });
        } else {
          return res.status(400).json({ errMsg: false, response: Result });
        }
      });

      // const users =  AgentMasters.findAll();
    } catch (error) {
      return res.status(500).json({ status: "FAILED", data: error });
    }
  }
  async WeekDaysList(req, res, next) {
    try {
      // const { ReportType, Date } = req.body;

      await Week_Masters.findAll().then(async (Result) => {
        if (Result.length != 0) {
          return res.status(200).json({ errMsg: false, response: Result });
        } else {
          return res.status(400).json({ errMsg: false, response: Result });
        }
      });

      // const users =  AgentMasters.findAll();
    } catch (error) {
      return res.status(500).json({ status: "FAILED", data: error });
    }
  }
  async monthList(req, res, next) {
    try {
      // const { ReportType, Date } = req.body;

      await month_Master.findAll().then(async (Result) => {
        if (Result.length != 0) {
          return res.status(200).json({ errMsg: false, response: Result });
        } else {
          return res.status(400).json({ errMsg: false, response: Result });
        }
      });

      // const users =  AgentMasters.findAll();
    } catch (error) {
      return res.status(500).json({ status: "FAILED", data: error });
    }
  }
  async businessList(req, res, next) {
    try {
      await business_Master.findAll().then(async (result) => {
        if (result.length != 0) {
          return res.status(200).json({ errMsg: false, response: result });
        } else {
          return res.status(400).json({ errMsg: false, response: result });
        }
      });
    } catch (error) {
      return res.status(500).json({ status: "failed", response: error });
    }
  }
  async yearList(req, res, next) {
    try {
      await year_Master.findAll().then(async (result) => {
        if (result.length != 0) {
          return res.status(200).json({ errMsg: false, response: result });
        } else {
          return res.status(400).json({ errMsg: false, response: result });
        }
      });
    } catch (error) {
      return res.status(500).json({ status: "failed", response: error });
    }
  }
  async customertypeList(req, res, next) {
    try {
      await CustomerType_Master.findAll().then(async (result) => {
        if (result.length != 0) {
          return res.status(200).json({ errMsg: false, response: result });
        } else {
          return res.status(400).json({ errMsg: false, response: result });
        }
      });
    } catch (error) {
      return res.status(500).json({ status: "failed", response: error });
    }
  }
  async UserTypeList(req, res, next) {
    try {
      const result = await User_Type_Masters.findAll({
        attributes: ["ID", "description"],
      });

      if (result != 0) {
        return res.status(200).json({ errMsg: false, response: result });
      } else {
        return res.status(400).json({ errMsg: false, response: result });
      }
    } catch (error) {
      return res.status(500).json({ status: "failed", response: error });
    }
  }
}

module.exports = new Dataservice();
