"use strict";

var OrderDetails = require("../../models/OrderDetails");

exports.addNewOrderDetails = function (req, res) {
  const newOrderDetails = new OrderDetails(req.body);
  OrderDetails.addNewOrderDetails(newOrderDetails, function (err, newOrderDetails) {
    err ? res.send(err) : res.send(newOrderDetails);
  });
};
