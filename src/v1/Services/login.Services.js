const { sq } = require("../../DataBase/ormdb");
const { UserMasters } = require("../Model/UserMaster.Model");
const { QueryTypes, UUIDV4 } = require("sequelize");
const bcrypt = require("bcryptjs");
const JWT = require("jsonwebtoken");
// const SecreateKey = "kl@#$^&%$@%!$#qwhepiu`ypidunsxjibsxjg63244543654654qww";
const http = require("http");
const crypto = require("crypto");
const { v4: uuidv4 } = require("uuid");
const { CompanyMasters } = require("../Model/CompanyMaster.Model");
const { country_masters } = require("../Model/CountryMaster.Model");
const { User_Type_Masters } = require("../Model/UserType.Model");
const { State_Details_Master } = require("../Model/state_detailsMaster.Model");
// const { log } = require("console");
const Pwd = bcrypt.genSaltSync(10);
class LoginService {
  async getlogin(req, res, next) {
    try {
      const { uniqueId, Password: Pass } = req.body; // Destructure body for required fields

      // Check if input is missing
      if (!uniqueId || !Pass) {
        console.log(req.body, "hei");
        return res
          .status(404)
          .json({ errMsg: true, response: "Input Missing!!!" });
      }

      // Query the database for the user based on LoginCode
      // const result = await sq.query(
      //   "SELECT * FROM `usermasters` WHERE `LoginCode`=:uniqueId",
      //   {
      //     replacements: { uniqueId },
      //     type: QueryTypes.SELECT,
      //   }
      // );

      let result = await UserMasters.findOne({
        where: { LoginCode: uniqueId }, // Use the correct query criteria for identifying the user
      });
      const user = result?.dataValues;
    //  console.log(result?.dataValues, "hi guys\n");

      // If no user found, return an error response
      if (!(user?.ID)) {
        console.log("Invalid user");
        return res.status(400).json({ errMsg: true, response: "Invalid user" });
      }
      console.log(user);

      // Compare the provided password with the stored password using bcrypt
      const isPasswordValid = bcrypt.compareSync(Pass, user?.Password);
      if (!isPasswordValid) {
        console.log("Invalid password");
        return res
          .status(400)
          .json({ errMsg: true, response: "Invalid password" });
      }

      // Check if the user is active
      if (user.Active != 1) {
        return res
          .status(400)
          .json({ errMsg: true, response: "User is not active" });
      }

      // If the user is valid and active, generate the JWT tokens
      const accessToken = JWT.sign({ suid: user.UUid }, process.env.SECRET, {
        expiresIn: "2m",
      });
      const refreshToken = JWT.sign({ suid: user.UUid }, process.env.SECRET, {
        expiresIn: "1d",
      });

      // Combine the user data and tokens
      const userWithTokens = {
        ...user,
        AccessToken: accessToken,
        refreshToken,
      };

      if (result) {
        await result.update({ LogOut: 0 });
      }
      console.log(userWithTokens, "User successfully logged in");

      const user_types = await User_Type_Masters.findOne({
        where: { ID: user.Utype },
      });
      console.log(user_types);
      // Return the success response with the user details and tokens
      return res.status(200).json({
        errMsg: false,
        response: {
          msg: "User successfully logged in",
          details: userWithTokens,
          permission_check: user_types,
        },
      });
    } catch (error) {
      console.log(error);
      return res
        .status(error?.status || 500)
        .json({ status: "FAILED", data: { error: error?.response || error } });
    }
  }

  async ForgetPass(req, res, next) {
    const generateRandomPassword = (length) => {
      const Upperchars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
      const LowerChars = "abcdefghijklmnopqrstuvwxyz";
      const numeric = "0123456789";
      const specialChar = "!@$";
      const charset = [Upperchars, LowerChars, numeric, specialChar];
      let password = "";
      const allchar = charset.join("");

      const randomUpper = crypto.randomInt(0, Upperchars.length);
      const randomLower = crypto.randomInt(0, LowerChars.length);
      const randomNumeric = crypto.randomInt(0, numeric.length);
      const randomSpecial = crypto.randomInt(0, specialChar.length);

      password =
        Upperchars[randomUpper] +
        LowerChars[randomLower] +
        numeric[randomNumeric] +
        specialChar[randomSpecial];

      for (let i = 0; i < length - charset.length; i++) {
        const randomIndex = crypto.randomInt(0, allchar.length);
        password += allchar[randomIndex];
      }
      // Split the string into an array of characters
      const chars = password.split("");

      // Sort the array using a custom comparison function
      chars.sort(() => Math.random() - 0.5);

      // Join the array back into a string
      return chars.join("");
    };
    try {
      var obj1, obj2, obj3, obj4, obj5, obj6;
      // const uniqueId = req.body.uniqueId;
      const PhoneNo = req.body.PhoneNo;
      var name;
      var password;
      console.log(req.body);
      if (!PhoneNo) {
        return res.status(400).json({
          errMsg: true,
          response: "You Have To Enter Phone Number First!!!",
        });
      } else {
        const Loginsecure = await sq.sync().then(async () => {
          sq.query(
            "SELECT * FROM `usermasters` WHERE  `PhoneNumber`=:PhoneNo",
            { replacements: { PhoneNo: PhoneNo }, type: QueryTypes.SELECT }
          )
            .then(async (result) => {
              console.log(result[0]);
              if (result.length === 0) {
                console.log("invalid user");
                return res
                  .status(401)
                  .json({ errMsg: true, response: "No Such User!!!" });
              } else {
                const length = 7; // Length of the password
                name = result[0].UserName;
                password = generateRandomPassword(length);
                console.log(password);
                const hashPassword = bcrypt.hashSync(password, Pwd);
                console.log(hashPassword);
                await sq
                  .query(
                    `Update usermasters set password=:password where PhoneNumber =:PhoneNo`,
                    {
                      replacements: {
                        PhoneNo: PhoneNo,
                        password: hashPassword,
                      },
                      type: QueryTypes.UPDATE,
                    }
                  )
                  .then(async (res3) => {
                    console.log(password);
                    var url = "";
                    ////___________________________________SMS Integration_______________________________

                    url =
                      url +
                      "http://trans.pmcbulksms.com/submitsms.jsp?user=BANGASREE&key=80d40e2427XX";
                    url =
                      url +
                      "&mobile=+91" +
                      PhoneNo +
                      "&message=Hello " +
                      name +
                      ", Your password for Login ID " +
                      PhoneNo +
                      " has been reset. Your new password is " +
                      password +
                      " . Please change your password after logging in. In case you have not requested for a new password, please contact 8585023758 and report. Regards, Bangasree Jewellers&senderid=BJSWRN&accusage=1&entityid=1201170685649952029&tempid=1207171266143917568";
                    console.log(url);
                    http
                      .get(url, (response) => {
                        let data = "";

                        // A chunk of data has been received.
                        response.on("data", (chunk) => {
                          data += chunk;
                        });
                        response.on("end", () => {
                          console.log(data);
                        });
                      })
                      .on("error", (error) => {
                        console.error(`Error: ${error.message}`);
                      });
                    //__________________________________________________________________________________________________________
                    return res.status(200).json({
                      errmsg: false,
                      response:
                        "Please Check Your Registred Phone Number For New PassWord!!!",
                    });
                  });
              }
            })
            .catch((err) => {
              console.log(err);
            });
        });
        return Loginsecure;
      }
    } catch (error) {
      console.log(error);
      return res
        .status(error?.status || 500)
        .json({ status: "FAILED", data: { error: error?.response || error } });
    }
  }
  async ResetPass(req, res, next) {
    try {
      var obj1, obj2, obj3, obj4, obj5, obj6;
      // const uniqueId = req.body.uniqueId;
      const PhoneNo = req.body.PhoneNo;
      const Pass = req.body.password;
      const NewPass = req.body.Newpassword;
      console.log(req.body);
      if (!PhoneNo && !Pass) {
        return res
          .status(400)
          .json({ errMsg: true, response: "Input Missing!!!" });
      } else {
        const Loginsecure = await sq.sync().then(async () => {
          sq.query(
            "SELECT * FROM `usermasters` WHERE  `PhoneNumber`=:PhoneNo",
            { replacements: { PhoneNo: PhoneNo }, type: QueryTypes.SELECT }
          )
            .then(async (result) => {
              console.log(result[0]);
              if (result.length === 0) {
                console.log("invalid user");
                return res
                  .status(401)
                  .json({ errMsg: true, response: "invalid user" });
              } else {
                console.log(result[0].Password);
                const checkPassword = bcrypt.compareSync(
                  Pass,
                  result[0].Password
                );
                console.log(checkPassword);
                if (!checkPassword) {
                  return res.status(400).json({
                    errMsg: true,
                    response: "Wrong Username and Password",
                  });
                } else {
                  const hashPassword = bcrypt.hashSync(NewPass, Pwd);
                  await sq
                    .query(
                      `Update usermasters set password=:password where PhoneNumber =:PhoneNo`,
                      {
                        replacements: {
                          PhoneNo: PhoneNo,
                          password: hashPassword,
                        },
                        type: QueryTypes.UPDATE,
                      }
                    )
                    .then(async (res3) => {
                      return res.status(200).json({
                        errmsg: false,
                        response: "Password Reset Successfully!!!",
                      });
                    });
                }
              }
            })
            .catch((err) => {
              console.log(err);
            });
        });
        return Loginsecure;
      }
    } catch (error) {
      console.log(error);
      return res
        .status(error?.status || 500)
        .json({ status: "FAILED", data: { error: error?.response || error } });
    }
  }
  async registration(req, res, next) {
    try {
      const {
        CompanyCode,
        companyName,
        Address,
        ContactNumber,
        GSTIN,
        PANNo,
        Country,
        Email,
        Utype,
        pass,
        Name,
      } = req.body;

      if (
        !CompanyCode ||
        !companyName ||
        !Address ||
        !ContactNumber ||
        !GSTIN ||
        !PANNo ||
        !Country ||
        !Email ||
        !Utype ||
        !pass
      ) {
        return res.status(400).json({ message: "Missing required fields" });
      }
      const state = req.body.id_state;
      const user = req.user;
      // console.log(user);
      if (user.Utype != 1) {
        return res.status(400).json({ message: "Unauthorized Request!!" });
      }
      const isExist = await CompanyMasters.findOne({
        where: { ContactNumber: ContactNumber },
      });
      if (isExist) {
        return res.status(400).json({ message: "This company already exists" });
      }

      // country exist
      const countryExist = await country_masters.findOne({
        where: { ID: Country },
      });
      // console.log(countryExist);

      if (!countryExist) {
        return res.status(400).json({ message: "This country does not exist" });
      }
      if (!countryExist.ID) {
        return res.status(400).json({ message: "COUNTRY ID DO NOT EXIST" });
      }
      const company = await CompanyMasters.create({
        CompanyCode: CompanyCode,
        companyName: companyName,
        Address: Address,
        ContactNumber: ContactNumber,
        GSTIN: GSTIN,
        PANNo: PANNo,
        Country: countryExist.Country_name,
        Status: 1,
        UUID: uuidv4(),
        LoginCode: ContactNumber,
      });

      if (company) {
        // Hash the password
        const hashedPassword = await bcrypt.hash(pass, 10);

        // Create the user record
        const userDetails = await UserMasters.create({
          LoginCode: ContactNumber,
          CompanyCode: CompanyCode,
          Email: Email,
          Password: hashedPassword,
          Utype: Utype,
          LogOut: 1,
          UUid: company.UUID,
          ID_Country: countryExist.ID,
          ZoneId: -1,
          Name: Name,
          Active: 1,
        });
        if (state.length != 0 && userDetails.Utype == 3) {
          for (let i = 0; i < state.length; i++) {
            await State_Details_Master.create({
              id_user: userDetails.ID,
              id_state: state[i],
              id_country: userDetails.ID_Country,
            });
          }
        }

        return res
          .status(201)
          .json({ message: "Company registered successfully" });
      } else {
        return res
          .status(400)
          .json({ message: "Company was not registered successfully" });
      }
    } catch (error) {
      console.error("Error occurred during registration:", error);
      return res
        .status(500)
        .json({ message: error.message || "Internal Server Error" });
    }
  }
}
module.exports = new LoginService();
