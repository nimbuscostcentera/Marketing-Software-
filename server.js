const express = require("express");
const bodyParser = require("body-parser");
const multer = require("multer");
const path = require("path");
const cors = require("cors");
require("dotenv").config({ path: "./src/config/.env" });

const IndexRoute = require("./src/v1/Routes/index");

const App = express();

const corsOptions = {
  origin: "*",
  optionsSuccessStatus: 200,
  // Temporarily allowing all origins for testing
  // origin: '*',
};
App.use(cors(corsOptions));
App.use(express.static("src"));
App.use(express.json());

//  App.use(cors("*"));
App.use(bodyParser.json());
App.use(
  bodyParser.urlencoded({
    extended: true,
  })
);
console.log("1");
//
App.use(express.urlencoded({ extended: true }));
App.use("/src/v1", IndexRoute);
App.use(
  "/images",
  express.static(
    path.join("D:", "WebProject", "Node", "Marketing_softwere", "Images")
  )
);
App.get("/", (req, res) => {
  return res.status(200).json({ message: "Hi, from nimbus." });
});

App.listen(8002, (err, res) => {
  if (err) {
    console.log(err);
  } else {
    console.log("port is running");
  }
});
