"use strict";

var Category = require("../../models/Category");

exports.getListCategories = function (req, res) {
  Category.getListCategories(function (err, categories) {
    err ? res.send(err) : res.send(categories);
  });
};
