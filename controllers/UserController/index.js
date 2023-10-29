"use strict";

var User = require("../../models/User");
var Product = require("../../models/Product");

exports.getAllUser = function (req, res) {
  User.getAllUser(function (err, user) {
    err ? res.send(err) : res.send(user);
  });
};

exports.createNewUser = function (req, res) {
  const newUser = new User(req.body);
  if (
    !newUser.nameOfUser ||
    !newUser.userName ||
    !newUser.password ||
    !newUser.level ||
    !newUser.address ||
    !newUser.phoneNumber
  ) {
    res.status(400).send({ error: true, message: "Please provide user information" });
  } else {
    User.createAUser(newUser, function (err, user) {
      err ? res.send(err) : res.json({ error: false, message: "Create a user successfully" });
    });
  }
};

exports.getUserById = function (req, res) {
  User.getAUserById(req.params.userId, function (err, user) {
    err ? res.send(err) : res.json(user);
  });
};

exports.getAUserByUserName = function (req, res) {
  User.getAUserByUserName(req.params.userName, function (err, user) {
    err ? res.send(err) : res.json(user);
  });
};

exports.updateAUserInformation = function (req, res) {
  User.updateAUser(req.params.userId, new User(req.body), function (err, user) {
    err ? res.send(err) : res.json(user);
  });
};

exports.deleteAUserById = function (req, res) {
  User.deleteAUser(req.params.userId, function (err, user) {
    err ? res.send(err) : res.json({ message: "User was deleted successfully" });
  });
};

exports.getListProductsOrdered = function (req, res) {
  const idUser = req.params.userId;
  Product.getListProductsOrdered(idUser, function (err, data) {
    err ? res.send(err) : res.send(data);
  });
};
