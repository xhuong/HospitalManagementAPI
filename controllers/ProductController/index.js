"use strict";
var Product = require("../../models/Product");

exports.getListNewProducts = function (req, res) {
  Product.getListNewProducts(function (err, product) {
    err ? res.send(err) : res.send(product);
  });
};

exports.getProductsByFilter = function (req, res) {
  const idCategory = req.query.idCategory;
  const size = req.query.size;
  const color = req.query.color;
  const minPrice = req.query.minPrice;
  const maxPrice = req.query.maxPrice;

  Product.getListProductsByFilter(idCategory, size, color, minPrice, maxPrice, function (err, product) {
    err ? res.send(err) : res.send(product);
  });
};

exports.getTrendingProducts = function (req, res) {
  Product.getTrendingProducts(function (err, products) {
    err ? res.send(err) : res.send(products);
  });
};


exports.getProductById = function (req, res) {
  var idProduct = req.params.id;
  Product.getProductById(idProduct, function (err, data) {
    err ? res.send(err) : res.send(data);
  });
};

exports.findProductsByName = function (req, res) {
  const id = req.query.idCategory;
  const keyword = req.query.keyword;
  Product.findProductsByName(id, keyword, function (err, data) {
    err ? res.send(err) : res.send(data);
  });
};

exports.searchProductsByName = function (req, res) {
  const keyword = req.query.productName;
  Product.searchProductsByName(keyword, function (err, data) {
    err ? res.send(err) : res.send(data);
  });
};
exports.getAllProduct = function (req, res) {
  Product.getAllProduct(function (err, data) {
    err ? res.send(err) : res.send(data);
  });
};
