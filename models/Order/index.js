"user strict";
var sql = require("../db");

var Order = function (order) {
  this.orderDate = order.orderDate;
  this.shippedDate = order.shippedDate;
  this.status = order.status;
  this.idUser = order.idUser;
};

Order.addNewOrder = function addNewOrder(newOrder, result) {
  sql.query("INSERT INTO orders set ? ", newOrder, function (err, res) {
    err ? result(err, null) : result(null, res);
  });
};

Order.getNewestOrder = function getNewestOrder(result) {
  sql.query("SELECT * FROM Orders ORDER BY id DESC LIMIT 1", function (err, res) {
    err ? result(err, null) : result(null, res);
  });
};

Order.addNewOrderDetails = function addNewOrderDetails(result) {
  sql.query("SELECT * FROM Orders ORDER BY id DESC LIMIT 1", function (err, res) {
    err ? result(err, null) : result(null, res);
  });
};

Order.getAllProductsOrdered = function getAllProductsOrdered(result) {
  sql.query(
    "SELECT idOrder, idProduct, orderDate, shippedDate, status, quantityOrdered, productImages, unitPrice, nameOfProduct, priceOfProduct, size, color FROM orders t1 INNER JOIN orderdetails t2 ON t1.id = t2.idOrder INNER JOIN products t3 ON t2.idProduct = t3.id ORDER BY idOrder",
    function (err, res) {
      err ? result(err, null) : result(null, res);
    }
  );
};

module.exports = Order;
