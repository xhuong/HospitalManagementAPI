"user strict";
var sql = require("../db");

var Category = function (category) {
  this.name = category.name;
};

Category.getListCategories = function getListCategories(result) {
  sql.query("SELECT * FROM Categories", function (err, res) {
    err ? result(err, null) : result(null, res);
  });
};

module.exports = Category;
