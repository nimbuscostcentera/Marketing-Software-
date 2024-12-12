const express = require("express");
const router = express.Router();
const multer = require("multer");
const path = require("path");
const AWS = require("aws-sdk");
const { AuthController } = require("../Controller");
const fs = require("fs");
require("dotenv").config();
var baseurl = "D:NimbusEstimate\backendImages";
const dotenv = require("dotenv");
const utils = require("../utils/index");

// Specify the path to your .env file

require("dotenv").config({ path: "../../../.env" });
var ID = process.env.ID;
var SECRET = process.env.SECRET;
var BUCKET_NAME = process.env.BUCKET_NAME;

console.log(SECRET, BUCKET_NAME, "s14");
const s3 = new AWS.S3({
  accessKeyId: ID,
  secretAccessKey: SECRET,
});

const params = {
  Bucket: BUCKET_NAME,
  CreateBucketConfiguration: {
    // Set your region here
    LocationConstraint: "ap-south-1",
  },
};

// s3.createBucket(params, function(err, data) {
//   if (err) console.log(err, err.stack);
//   else console.log('Bucket Created Successfully', data.Location);
// });
//------------------------------agent---------------------------------------------------------
const multerConfigagent = multer.memoryStorage();
const uploadAgent = multer({
  storage: multerConfigagent,
  // Limits configuration to restrict file size and number of files
  limits: {
    fileSize: 2 * 1024 * 1024, // 2 MB (in bytes)
    files: 3, // Maximum 5 files
  },
});
//-----------------------------------------------------------------------------

//---------------------------------superuser---------------------------------------

const multerConfigsuperuser = multer.memoryStorage();
const uploadSuperuser = multer({
  storage: multerConfigsuperuser,
  // Limits configuration to restrict file size and number of files
  limits: {
    fileSize: 2 * 1024 * 1024, // 2 MB (in bytes)
    files: 3, // Maximum 5 files
  },
});
//---------------------------------------------------------------------------------

//----------------------------------customer------------------------------------------
const multerConfigcustomer = multer.memoryStorage();
const uploadCustomer = multer({
  storage: multerConfigcustomer,
  // Limits configuration to restrict file size and number of files
  limits: {
    fileSize: 2 * 1024 * 1024, // 2 MB (in bytes)
    files: 6, // Maximum 5 files
  },
});
//--------------------------------------------------------------------------------------

console.log("3");
router.post("/token-generate", utils.GenerateToken);
router.post("/login", AuthController.securelogin);
router.post("/companyreg", utils.verifyToken, AuthController.companyReg);
router.post("/company-list", utils.verifyToken, AuthController.companylist);
router.post("/area-add", utils.verifyToken, AuthController.areaadd);
router.post("/city-add", utils.verifyToken, AuthController.cityadd);
router.post("/vendor-add", utils.verifyToken, AuthController.vendoradd);
router.post("/state-add", utils.verifyToken, AuthController.stateadd);
router.post(
  "/country-add",
  utils.verifyToken,
  utils.permissionCountry,
  AuthController.countryadd
);
router.post(
  "/country-list",
  utils.verifyToken,
  utils.permissionCountry,
  AuthController.countrylist
);
router.post("/zone-add", utils.verifyToken, AuthController.zoneadd);
router.post("/area-list", utils.verifyToken, AuthController.arealist);
router.post("/salesman-list", utils.verifyToken, AuthController.salesmanlist);
router.post("/city-list", utils.verifyToken, AuthController.citylist);
// router.post("/vendor-list", AuthController.vendorlist);
router.post("/industry-list", utils.verifyToken, AuthController.industrylist);
router.post("/state-list", AuthController.statelist);
router.post("/customer-add", AuthController.customeradd);
router.post("/customer-list", utils.verifyToken, AuthController.customerlist);
router.post("/zone-list", utils.verifyToken, AuthController.zonelist);

// get usertype details
router.get("/usertype-list", utils.verifyToken, AuthController.UserListType);

router.post("/admin", utils.verifyToken, AuthController.adminPanel);
router.post("/industry-add", utils.verifyToken, AuthController.industryadd);
//By tarashis
router.route("/getmonthlist").get(AuthController.monthlist);
router.route("/getbusinesslist").get(AuthController.businessList);
router.route("/year").post(AuthController.yearAdd).get(AuthController.yearList);
router
  .route("/customer-type")
  .post(AuthController.custTypeAdd)
  .get(AuthController.custList);
router
  .route("/fbtype")
  .post(AuthController.fbtypeadd)
  .get(AuthController.fbtypelist);
router.route("/weekdays").get(AuthController.weekdayslist);
//  router.post("/token-generate",PermissonCheck.GenerateToken);
router.post("/user-registration", AuthController.UserRegistration);

router.post("/user-edit", AuthController.UserEdit);

// router.post("/forget-password", Logger.Logreq,AuthController.forgetpass,Logger.Logres);
// router.post("/reset-password",Logger.Logreq , AuthController.resetpass,Logger.Logres);

// router.post("/loginauthcontroller/loginservices/login",securelogin);
module.exports = router;
