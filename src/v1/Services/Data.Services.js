const { sq } = require("../../DataBase/ormdb");
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
const moment = require('moment')
const {
  Feedback_Transactions,
} = require("../Model/Feedback_Transaction.Model");
const { CustomerType_Master } = require("../Model/CustomerTypeMaster.Model");
const { year_Master } = require("../Model/YearMaster.Model");
const { month_Master } = require("../Model/MonthMaster.Model");
class Dataservice {
  async AreaList(req, res, next) {
    const { CompanyCode, ReportType, Date, zone_id } = req.body;
    let zoneObj = { CompanyCode: CompanyCode };
    if (zone_id !== undefined && zone_id !== null && zone_id !== "") {
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
  // async VendorList(req, res, next) {
  //   try {
  //     const { CompanyCode, ReportType, Date } = req.body;

  //     await Vendor_Masters.findAll().then(async (Result) => {
  //       if (Result.length != 0) {
  //         return res.status(200).json({ errMsg: false, response: Result });
  //       } else {
  //         return res.status(400).json({ errMsg: false, response: Result });
  //       }
  //     });

  //     // const users =  AgentMasters.findAll();
  //   } catch (error) {
  //     return res.status(500).json({ status: "FAILED", data: error });
  //   }
  // }
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
      await state_masters
        .findAll({
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
      console.log(error);
      return res.status(500).json({ status: "FAILED", data: error });
    }
  }
  // async AdminPanel(req, res, next) {
  //   try {
  //     const { CompanyCode, StartDate, EndDate } = req.body;
  //     let sql = `Select * from customer_masters as cm inner join feedback_transactions as ft
  //   on cm.ID = ft.Id_Name inner join area_masters as am on am.ID=cm.id_area inner join city_masters as cim on
  //   cim.ID=cm.id_city inner join state_masters as sm on sm.ID=cm.id_state inner join country_masters as con
  //   on con.ID=cm.COUNTRY`;
  //     sq.sync();
  //     const dnconn = await sq
  //       .query(sql, {
  //         type: QueryTypes.SELECT,
  //       })
  //       .then(async (resp) => {
  //         console.log(resp, "hl");
  //         return res.status(200).json({ response: resp });
  //       })
  //       .catch((err) => {
  //         console.log(err);
  //       });
  //     return dnconn;
  //   } catch (error) {
  //     return res.status(500).json({ status: "FAILED", data: error });
  //   }
  // }
  async AdminPanel(req, res, next) {
    const { CompanyCode, StartDate, EndDate, today, fbtype, Area } = req.body;

    let obj = { CompanyCode: CompanyCode };
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
                attributes:[],
              required: true
            }
          ],
          where: { ...obj },
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
      const { CompanyCode, Date } = req.body;
      let sql = "";
      //sql ="SELECT Cm.*, Am.Code, Sm.State_name,City.NAME AS City_Name, Vm1.NAME AS Vendor_Name, Vm2.NAME AS Vendor1_Name FROM customer_masters AS Cm JOIN area_masters AS Am ON Cm.id_area = Am.id JOIN state_masters AS Sm ON Cm.id_state = Sm.id JOIN city_masters AS City ON Cm.id_city = City.id JOIN vendor_masters AS Vm1 ON Cm.ID_Vendor = Vm1.id JOIN vendor_masters AS Vm2 ON Cm.ID_Vendor1 = Vm2.id and Cm.CompanyCode=:CompanyCode	";
      sql = "SELECT * FROM customer_masters";
      let resDB = sq
        .query(sql, {
          replacements: { CompanyCode: CompanyCode },
          type: QueryTypes.SELECT,
        })
        .then(async (Result) => {
          if (Result?.length !== 0) {
            return res.status(200).json({ errMsg: false, response: Result });
          } else {
            return res.status(400).json({ errMsg: false, response: [] });
          }
        });
      return resDB;
      // const users =  AgentMasters.findAll();
    } catch (error) {
      return res.status(400).json({ status: "FAILED", data: error });
    }
  }
  async SalesmanList(req, res, next) {
    try {
      const { CompanyCode } = req.body;

      await SalesManMaster.findAll({
        // where: {
        //   CompanyCode: CompanyCode,
        // },
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
      const { CompanyCode, ReportType, Date } = req.body;

      await CompanyMasters.findAll().then(async (Result) => {
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
}

module.exports = new Dataservice();
