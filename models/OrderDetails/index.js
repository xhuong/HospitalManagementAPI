"user strict";
var sql = require("../db");

var OrderDetails = function (orderDetails) {
  this.idOrder = orderDetails.idOrder;
  this.idProduct = orderDetails.idProduct;
  this.quantityOrdered = orderDetails.quantityOrdered;
  this.unitPrice = orderDetails.unitPrice;
};

OrderDetails.addNewOrderDetails = function addNewOrderDetails(orderDetails, result) {
  sql.query("INSERT INTO orderdetails set ? ", orderDetails, function (err, res) {
    err ? result(err, null) : result(null, res);
  });
};

module.exports = OrderDetails;
