const { LoginService } = require("../Services");
const { UserRegService, Masterservice, Dataservice } = require("../Services");
class AuthController {
  async securelogin(req, res, next) {
    try {
      const AuthResponse = await LoginService.getlogin(req, res, next);
      return AuthResponse;
    } catch (error) {
      console.log(error);
      return res.status(500).json({ errMsg: "error", response: error });
    }
  }
  async UserRegistration(req, res, next) {
    console.log("ok");
    try {
      await UserRegService.UserReg(req, res, next);
      next();
    } catch (err) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async companyReg(req, res, next) {
    try {
      const AuthResponse = await LoginService.registration(req, res, next);
      return AuthResponse;
    } catch (error) {
      console.log(error);
      return res.status(500).json({ errMsg: "error", response: error });
    }
  }
  async UserEdit(req, res, next) {
    console.log("ok");
    try {
      await UserRegService.UserEdit(req, res, next);
      next();
    } catch (err) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async areaadd(req, res, next) {
    console.log("ok");
    try {
      await Masterservice.Areaadd(req, res, next);
      next();
    } catch (err) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async cityadd(req, res, next) {
    console.log("ok");
    try {
      await Masterservice.Cityadd(req, res, next);
      next();
    } catch (err) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async vendoradd(req, res, next) {
    console.log("ok");
    try {
      await Masterservice.Vendoradd(req, res, next);
      next();
    } catch (err) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async stateadd(req, res, next) {
    console.log("ok");
    try {
      await Masterservice.Stateadd(req, res, next);
      next();
    } catch (err) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async arealist(req, res, next) {
    console.log("ok");
    try {
      await Dataservice.AreaList(req, res, next);
      next();
    } catch (err) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async industrylist(req, res, next) {
    // console.log("ok");
    try {
      await Dataservice.IndustryList(req, res, next);
      next();
    } catch (err) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async customeradd(req, res, next) {
    console.log("ok");
    try {
      await Masterservice.CustomerAdd(req, res, next);
      next();
    } catch (err) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async countryadd(req, res, next) {
    console.log("ok");
    try {
      await Masterservice.CountryAdd(req, res, next);
      next();
    } catch (err) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async zoneadd(req, res, next) {
    console.log("ok");
    try {
      await Masterservice.ZoneAdd(req, res, next);
      next();
    } catch (err) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async countrylist(req, res, next) {
    console.log("ok");
    try {
      await Dataservice.CountryList(req, res, next);
      next();
    } catch (err) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async citylist(req, res, next) {
    console.log("ok");
    try {
      await Dataservice.CityList(req, res, next);
      next();
    } catch (err) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async statelist(req, res, next) {
    console.log("ok");
    try {
      await Dataservice.StateList(req, res, next);
      next();
    } catch (err) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async UserListType(req,res,next){
    try {
      await Dataservice.UserTypeList(req,res,next)
      next()
    } catch (error) {
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async customerlist(req, res, next) {
    console.log("ok");
    try {
      await Dataservice.CustomerList(req, res, next);
      next();
    } catch (err) {
      console.log(err);
      // return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async salesmanlist(req, res, next) {
    console.log("ok");
    try {
      await Dataservice.SalesmanList(req, res, next);
      next();
    } catch (err) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async salesmanadd(req, res, next) {
     try {
       await Masterservice.SalesManRegistration(req, res, next);
       next();
     } catch (err) {
       console.log(err);
       return res.status(500).json({ errMsg: "error", response: err });
     }
  }
  async companylist(req, res, next) {
    console.log("ok");
    try {
      await Dataservice.CompanyList(req, res, next);
      next();
    } catch (err) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async zonelist(req, res, next) {
    console.log("ok");
    try {
      await Dataservice.zonelist(req, res, next);
      next();
    } catch (err) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async adminPanel(req, res, next) {
    console.log("ok");
    try {
      await Dataservice.AdminPanel(req, res, next);
      next();
    } catch (err) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async fbtypeadd(req, res, next) {
    // console.log("ok");
    try {
      await Masterservice.FBTypeAdd(req, res, next);
      next();
    } catch (err) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async fbtypelist(req, res, next) {
    console.log("ok");
    try {
      await Dataservice.FBTypeList(req, res, next);
      next();
    } catch (err) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async weekdayslist(req, res, next) {
    console.log("ok");
    try {
      await Dataservice.WeekDaysList(req, res, next);
      next();
    } catch (err) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async monthlist(req, res, next) {
    try {
      await Dataservice.monthList(req, res, next);
      next();
    } catch (err) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async businessList(req, res, next) {
    try {
      await Dataservice.businessList(req, res, next);
      next();
    } catch (error) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async yearList(req, res, next) {
    try {
      await Dataservice.yearList(req, res, next);
      next();
    } catch (error) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async yearAdd(req, res, next) {
    try {
      await Masterservice.YearAdd(req, res, next);
      next();
    } catch (error) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async custList(req, res, next) {
    try {
      await Dataservice.customertypeList(req, res, next);
      next();
    } catch (error) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async custTypeAdd(req, res, next) {
    try {
      await Masterservice.CustTypeAdd(req, res, next);
      next();
    } catch (error) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
  async industryadd(req, res, next) {
    try {
      await Masterservice.Industryadd(req, res, next);
      next();
    } catch (err) {
      console.log(err);
      return res.status(500).json({ errMsg: "error", response: err });
    }
  }
}
module.exports = new AuthController();
