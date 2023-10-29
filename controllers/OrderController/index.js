"use strict";

var Order = require("../../models/Order");

exports.addNewOrder = function (req, res) {
  // by default: shippedDate is null
  const shippedDate = null;
  const newOrder = new Order({ ...req.body, shippedDate });
  if (!newOrder.idUser || !newOrder.orderDate || newOrder.status < 0) {
    res.status(400).send({ error: true, message: "Please provide order data" });
  } else {
    Order.addNewOrder(newOrder, function (err) {
      err ? res.send(err) : res.json({ err: false, message: "Your order was added success." });
    });
  }
};

exports.getNewestOrder = function (req, res) {
  Order.getNewestOrder(function (err, newestOrder) {
    err ? res.send(err) : res.send(newestOrder);
  });
};

exports.getAllProductsOrdered = function (req, res) {
  Order.getAllProductsOrdered(function (err, result) {
    err ? res.send(err) : res.send(result);
  });
};
