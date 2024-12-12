const { sq } = require("../../DataBase/ormdb");
const { QueryTypes } = require("sequelize");
// const { SuperUserMasters } = require("../Model/SuperUserMaster.Model");
const { UserMasters } = require("../Model/UserMaster.Model");
// const { UserPermissions } = require("../Model/UserPermission.Model");
// const { UserDefault } = require("../Model/UserDefault.Model");
// const { PageMasters } = require("../Model/PageMaster.Model");
const JWT = require("jsonwebtoken");
const { response } = require("express");
const { country_masters } = require("../Model/CountryMaster.Model");
// const SecreateKey = "kl@#$^&%$@%!$#qwhepiu`ypidunsxjibsxjg63244543654654qww";
class Permission {
  // checkPermissionMiddleware = async (req, res, next) => {
  //   console.log(req.url, req.headers, "pe4rmis");
  //   try {
  //     var validate = 0;
  //     var uuid = req.body.LoggerUUid;
  //     var CompanyCode = req.body.CompanyCode;
  //     var requrl = req.url;
  //     UserMasters.findAll({
  //       where: {
  //         CompanyCode: CompanyCode,
  //         UUid: uuid,
  //       },
  //     }).then((Result) => {
  //       if (Result.length != 0) {
  //         sq.query(
  //           "select up.* from  `userpermissions` as up,`pagemasters` as pm where pm.PageId=up.PageId and ((pm.addurl=:requrl and up.Add=1) or (pm.Viewurl=:requrl and 	up.View=1)or(pm.EditUrl=:requrl and 	up.Edit=1)or(pm.DelUrl=:requrl and 	up.Del=1)) and up.UUid=:uuid ",
  //           {
  //             replacements: {
  //               uuid: uuid,
  //               requrl: requrl,
  //             },
  //             type: QueryTypes.SELECT,
  //           }
  //         ).then((Rst) => {
  //           if (Rst.length != 0) {
  //             next();
  //             console.log(validate);
  //           } else {
  //             console.log("trrd");
  //             res.status(403).json({ Response: "Permission Denied" });
  //           }
  //         });
  //       } else {
  //         console.log("trrd");
  //         res.status(403).json({ Response: "Permission Denied" });
  //       }
  //       if (validate == 1) {
  //         // If permission is granted, call the next middleware or controller
  //       } else {
  //         // If permission is denied, send an error response
  //       }
  //     });
  //     console.log("after check!!", validate);
  //   } catch (err) {
  //     console.log(err);
  //     return res.status(400).json("error");
  //   }


  // };
  //  async verifyToken(req, res, next) {
  //     const RefreshToken = req.header("RefreshToken");
  //     const AccessToken = req.header("Authorization");
  //    console.log(AccessToken, RefreshToken, "my access token in verify token");
  //     if (!AccessToken) {
  //       //console.log("no");
  //       return res.status(401).json({ response: " AccessToken is missing" });
  //     } else {
  //      // console.log("hello");
  //       try {
  //         const decoded = await JWT.verify(
  //           AccessToken.split(" ")[1],
  //           process.env.SECRET
  //         );
  //         req.UUid = decoded.suid;
  //       //  console.log(decoded, "piku");

  //        UserMasters.findOne({
  //         attributes: ["LogOut"],
  //         where: { UUid: req.body.LoggerUUid || req.body.UUid },
  //       })
  //         .then((res15) => {
  //           console.log(
  //             res15?.dataValues?.LogOut,
  //             "i am in permission check then"
  //           );
  //           let logout = res15?.dataValues?.LogOut;
  //           if (logout == 1) {
  //             return res.status(402).json({ response: "Permisson Changed" });
  //           } else {
  //             // if (req.url == "/verify-token") {
  //             //   console.log("yes", req.url);
  //             //   return res.status(200).json({ response: "verified" });
  //             // }
  //             next();
  //           }})
  //           .catch((err) => {
  //             console.log(err, "i am in permission check catch");
  //           });

  //       } catch (error) {
  //        console.log(error);
  //         if (error.name === "TokenExpiredError") {
  //           // Token has expired
  //           return res.status(401).json({ response: "Access Token has expired" });
  //         } else {
  //           // Other token verification errors
  //           return res.status(401).json({ response: "Invalid Access Token" });
  //         }
  //       }
  //     }
  //   }
  async verifyToken(req, res, next) {
    try {
      const RefreshToken = req.header("RefreshToken");
      const AccessToken = req.header("Authorization");
    //  console.log(AccessToken, RefreshToken, "my access token in verify token");

      // Check if AccessToken is provided
      if (!AccessToken) {
        return res.status(401).json({ response: "AccessToken is missing" });
      }

      // Verify the AccessToken
      const decoded = JWT.verify(
        AccessToken.split(" ")[1],
        process.env.SECRET
      );

      const UUid = decoded.suid;
      console.log(UUid, "Decoded UUid");

      // Search for UUid in UserMasters table
      const user = await UserMasters.findOne({
        where: { UUid },
      });

      if (!user) {
        // UUid not found in UserMasters
        return res.status(404).json({ response: "User not found" });
      }

      // Check if the user has logged out
      if (user.LogOut === 1) {
        return res.status(402).json({ response: "Permission Changed" });
      }

      // Attach UUid to request object for downstream processing
      req.UUid = UUid;
      req.user = user;

      // Proceed to the next middleware
      next();
    } catch (error) {
      console.error(error);

      if (error.name === "TokenExpiredError") {
        // Handle token expiration
        return res.status(401).json({ response: "Access Token has expired" });
      }

      // Handle other errors
      return res.status(401).json({ response: "Invalid Access Token" });
    }
  }
  async GenerateToken(req, res, next) {
    console.log("In the generateToken");

    // Extract the Refresh Token from the Authorization header
    const RefreshToken = req.header("Authorization");
    console.log("RefreshToken:", RefreshToken);

    if (!RefreshToken) {
      return res.status(400).json({ response: "Refresh Token is missing" });
    }

    try {
      // Verify the Refresh Token
      const decoded = JWT.verify(
        RefreshToken.split(" ")[1],
        process.env.SECRET
      );

      // Extract UUID from the decoded Refresh Token
      const uuid = decoded.suid;
      console.log("Decoded UUID:", uuid);

      // Check if the UUID exists in the UserMasters table
      const user = await UserMasters.findOne({
        attributes: ["UUid", "LogOut"],
        where: { UUid: uuid },
      });

      if (!user) {
        // User not found
        return res.status(404).json({ response: "User not found" });
      }

      if (user.LogOut === 1) {
        // User has logged out
        return res.status(402).json({ response: "Permission Changed" });
      }

      // Generate a new Access Token
      const accessToken = JWT.sign({ suid: uuid }, process.env.SECRET, {
        expiresIn: "2m",
      });

      // Return the new Access Token
      const responseObj = { AccessToken: accessToken };
      console.log("Generated AccessToken:", responseObj);

      return res.status(200).json({
        errMsg: false,
        response: responseObj,
      });
    } catch (error) {
      console.error(error);

      if (error.name === "TokenExpiredError") {
        // Handle expired Refresh Token
        return res.status(402).json({ response: "Refresh Token has expired" });
      }

      // Handle other errors
      return res.status(402).json({ response: "Invalid Refresh Token" });
    }
  }

  async permissionCountry(req, res, next) {
    try {
      
      console.log("permission country");

      const userId = req.UUid
      const userDetails = await UserMasters.findOne({
        where: { UUid: userId },
      })
      if (userDetails.Utype != 1) {
        const countryId = userDetails.ID_Country;
        const country= await country_masters.findOne({
          where: { ID: countryId }
        })
        if (!country) {
          return res.status(400).json({ message: "Country does not exist" });
        }
        req.country = country.Country_name;
        next();
      }else if(userDetails.Utype == 1){
        next();
      }
      // const user = await UserMasters.findOne({
      //   attributes: ["LogOut"],
      //   where: { UUid },
      // });
     
    } catch (error) {
        return res.status(500).json({ errMsg: "error", response: error });
    }
  }
}
module.exports = new Permission();
