const express = require("express"),
  app = express(),
  bodyParser = require("body-parser");
const cors = require("cors");

port = process.env.PORT || 3001;
app.listen(port);

console.log("API server started on: " + port);
app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

var routes = require("./routes");
routes(app);
