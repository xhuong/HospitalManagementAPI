"use strict";

var getAllTableName = require("../../models/Common");

exports.getAllTableName = function (req, res) {
  getAllTableName(function (err, result) {
    err ? res.send(err) : res.send(result);
  });
};
