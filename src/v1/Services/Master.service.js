const { sq } = require("../../DataBase/ormdb");
const { Area_Masters } = require("../Model/AreaMaster.Model");
const { city_masters } = require("../Model/city_masters.Model");
const { Vendor_Masters } = require("../Model/Vendor_Master.Model");
const { state_masters } = require("../Model/state_masters.Model");
const { customer_masters } = require("../Model/CustomerMaster.Model");
const { country_masters } = require("../Model/CountryMaster.Model");
const { zone_masters } = require("../Model/ZoneMaster.Model");
const { feedback_Transaction } = require("../Model/Feedback_Transaction.Model");
const { FBType_Masters } = require("../Model/FBType.Model");
const { v4: uuidv4 } = require("uuid");
const { CustomerType_Master } = require("../Model/CustomerTypeMaster.Model");
const { year_Master } = require("../Model/YearMaster.Model");
const { Industry_Masters } = require("../Model/Industry_Masters.Model");
class Masterservice {
  async Areaadd(req, res, next) {
    console.log(req.body);

    try {
      const {
        CompanyCode,
        Code,
        CLSSTATUS,
        daystatus,
        daystatus1,
        othday,
        othsttime,
        othentime,
        half,
        full,
      } = req.body;

      const tcode = "EST";
      const lastsrl = await Area_Masters.findAll({
        where: { Code: Code },
      });
      console.log(lastsrl);
      if (lastsrl?.length == 0) {
        await Area_Masters.create({
          Code: Code,
          CLSSTATUS: CLSSTATUS,
          daystatus: daystatus,
          daystatus1: daystatus1,
          othday: othday,
          othsttime: othsttime,
          othentime: othentime,
          half: half,
          full: full,
          CompanyCode: CompanyCode,
        });
        return res.status(200).json({
          errMsg: false,
          response: "Area Add successful",
        });
      } else {
        return res.status(400).json({
          errMsg: true,
          response: "Area Already Exists",
        });
      }
    } catch (error) {
      console.error("Error in Areaadd service:", error);

      // Send an error response
      if (!res.headersSent) {
        return res.status(500).json({
          errMsg: true,
          response: "An error occurred while adding the Area",
          error: error.message,
        });
      }
    }
  }
  async Cityadd(req, res, next) {
    console.log(req.body);

    try {
      const { NAME, id_state } = req.body;

      const lastsrl = await city_masters.findAll({
        where: { NAME: NAME },
      });

      if (lastsrl.length == 0) {
        await city_masters.create({
          NAME: NAME,
          id_state: id_state,
        });
        return res.status(200).json({
          errMsg: false,
          response: "City Add successful",
        });
      } else {
        return res.status(500).json({
          errMsg: true,
          message: "City Already Exists",
        });
      }

      // Process EstimateDetails

      // Send a successful response
    } catch (error) {
      console.error("Error in Cityadd service:", error);

      // Send an error response
      if (!res.headersSent) {
        return res.status(500).json({
          errMsg: true,
          response: "An error occurred while adding the City",
          error: error.message,
        });
      }
    }
  }
  async CountryAdd(req, res, next) {
    console.log(req.body);

    try {
      const { Country } = req.body;

      const lastsrl = await country_masters.findAll({
        where: { Country_name: Country },
      });

      if (lastsrl.length == 0) {
        await country_masters.create({
          Country_name: Country,
        });
        return res.status(200).json({
          errMsg: false,
          response: "City Add successful",
        });
      } else {
        return res.status(500).json({
          errMsg: true,
          message: "City Already Exists",
        });
      }

      // Process EstimateDetails

      // Send a successful response
    } catch (error) {
      console.error("Error in Cityadd service:", error);

      // Send an error response
      if (!res.headersSent) {
        return res.status(500).json({
          errMsg: true,
          response: "An error occurred while adding the City",
          error: error.message,
        });
      }
    }
  }
  async ZoneAdd(req, res, next) {
    console.log(req.body);

    try {
      const { NAME, Parent_zone, id_city } = req.body;

      const lastsrl = await zone_masters.findAll({
        where: { NAME: NAME },
      });

      if (lastsrl.length == 0) {
        await zone_masters.create({
          NAME: NAME,
          Parent_zone: Parent_zone,
          id_city: id_city,
        });
        return res.status(200).json({
          errMsg: false,
          response: "City Add successful",
        });
      } else {
        return res.status(500).json({
          errMsg: true,
          message: "City Already Exists",
        });
      }

      // Process EstimateDetails

      // Send a successful response
    } catch (error) {
      console.error("Error in Cityadd service:", error);

      // Send an error response
      if (!res.headersSent) {
        return res.status(500).json({
          errMsg: true,
          response: "An error occurred while adding the City",
          error: error.message,
        });
      }
    }
  }
  async Vendoradd(req, res, next) {
    console.log(req.body);

    try {
      const { NAME } = req.body;
      const lastsrl = await Vendor_Masters.findAll({
        where: { NAME: NAME },
      });
      console.log(lastsrl);
      if (lastsrl.length == 0) {
        await Vendor_Masters.create({
          NAME: NAME,
        });
        return res.status(200).json({
          errMsg: false,
          response: "Vendor Add successful",
        });
      } else {
        return res.status(500).json({
          errMsg: true,
          message: "Vendor Already Exists",
        });
      } // Send a successful response
    } catch (error) {
      console.error("Error in Vendoradd service:", error);

      // Send an error response
      if (!res.headersSent) {
        return res.status(500).json({
          errMsg: true,
          response: "An error occurred while adding the Vendor",
          error: error.message,
        });
      }
    }
  }
  async Stateadd(req, res, next) {
    console.log(req.body);

    try {
      const { State_name, id_country } = req.body;

      const lastsrl = await state_masters.findAll({
        where: { State_name: State_name },
      });

      if (lastsrl.length == 0) {
        await state_masters.create({
          State_name: State_name,
          id_country: id_country,
        });
        return res.status(200).json({
          errMsg: false,
          response: "State Add successful",
        });
      } else {
        return res.status(500).json({
          errMsg: true,
          message: "State Already Exists",
        });
      }

      // Process EstimateDetails

      // Send a successful response
    } catch (error) {
      console.error("Error in Stateadd service:", error);

      // Send an error response
      if (!res.headersSent) {
        return res.status(500).json({
          errMsg: true,
          response: "An error occurred while adding the State",
          error: error.message,
        });
      }
    }
  }
  async CustomerAdd(req, res, next) {
    console.log(req.body);

    try {
      const {
        CoName,
        PhNo,
        Mobile,
        PinCode,
        Contact_Name,
        ADDRESS,
        Remarks,
        id_area,
        id_state,
        id_city,
        CompanyCode,
        REFNAME,
        ID_Vendor,
        ID_Vendor1,
      } = req.body;

      const lastsrl = await customer_masters.findAll({
        where: { CoName: CoName },
      });

      if (lastsrl.length == 0) {
        await customer_masters.create({
          CoName: CoName,
          PhNo: PhNo,
          Mobile: Mobile,
          PinCode: PinCode,
          Contact_Name: Contact_Name,
          ADDRESS: ADDRESS,
          Remarks: Remarks,
          id_area: id_area,
          id_state: id_state,
          id_city: id_city,
          CompanyCode: CompanyCode,
          REFNAME: REFNAME,
          ID_Vendor: ID_Vendor,
          ID_Vendor1: ID_Vendor1,
        });
        return res.status(200).json({
          errMsg: false,
          response: "Customer Add successful",
        });
      } else {
        return res.status(400).json({
          errMsg: true,
          message: "Customer Already Exists",
        });
      }

      // Process EstimateDetails

      // Send a successful response
    } catch (error) {
      console.error("Error in Customeradd service:", error);

      // Send an error response
      if (!res.headersSent) {
        return res.status(500).json({
          errMsg: true,
          response: "An error occurred while adding the Customer",
          error: error.message,
        });
      }
    }
  }
  async FBTypeAdd(req, res, next) {
    // console.log(req.body);

    try {
      const { type } = req.body;

      await FBType_Masters.create({
        type_name: type,
      });
      return res.status(200).json({
        errMsg: false,
        response: "feedback Add successful",
      });

      // Process EstimateDetails

      // Send a successful response
    } catch (error) {
      console.error("Error in Cityadd service:", error);
      return res.status(500).json({
        errMsg: true,
        message: "feedback Already Exists",
      });
    }
  }
  async YearAdd(req, res, next) {
    // console.log(req.body);

    try {
      const { Session, startDate, endDate } = req.body;

      await year_Master.create({
        Session: Session,
        startDate: startDate,
        endDate: endDate,
      });
      return res.status(200).json({
        errMsg: false,
        response: "fiscal year added successful",
      });

      // Process EstimateDetails

      // Send a successful response
    } catch (error) {
      console.error("Error in year add service:", error);
      return res.status(500).json({
        errMsg: true,
        message: "year Already Exists",
      });
    }
  }

  async CustTypeAdd(req, res, next) {
    // console.log(req.body);

    try {
      const { custType } = req.body;

      await CustomerType_Master.create({
        type: custType,
      });
      return res.status(200).json({
        errMsg: false,
        response: "customer type added successful",
      });

      // Process EstimateDetails

      // Send a successful response
    } catch (error) {
      console.error("Error in customer add service:", error);
      return res.status(500).json({
        errMsg: true,
        message: "customer Already Exists",
      });
    }
  }
  async Industryadd(req, res, next) {
    console.log(req.body);

    try {
      const { NAME } = req.body;
      const lastsrl = await Industry_Masters.findAll({
        where: { NAME: NAME },
      });
      console.log(lastsrl);
      if (lastsrl.length == 0) {
        await Industry_Masters.create({
          NAME: NAME,
        });
        return res.status(200).json({
          errMsg: false,
          response: "Industry Add successful",
        });
      } else {
        return res.status(500).json({
          errMsg: true,
          message: "Industry Already Exists",
        });
      } // Send a successful response
    } catch (error) {
      console.error("Error in Industry add service:", error);

      // Send an error response
      if (!res.headersSent) {
        return res.status(500).json({
          errMsg: true,
          response: "An error occurred while adding the Industry",
          error: error.message,
        });
      }
    }
  }
}

module.exports = new Masterservice();
