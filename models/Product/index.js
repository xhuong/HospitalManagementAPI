"user strict";
var sql = require("../db");

var Product = function (product) {
  this.nameOfProduct = product.nameOfProduct;
  this.priceOfProduct = product.priceOfProduct;
  this.countOfProduct = product.countOfProduct;
  this.starOfProduct = product.starOfProduct;
  this.productImages = product.productImages;
  this.countOfReviewer = product.countOfReviewer;
  this.ProductDescription = product.ProductDescription;
  this.size = product.size;
  this.color = product.color;
  this.idCategory = product.idCategory;
};

Product.getListNewProducts = function getListNewProducts(result) {
  sql.query("SELECT * FROM Products LIMIT 32", function (err, res) {
    err ? result(err, null) : result(null, res);
  });
};

Product.getListProductsByFilter = function getListProductsByFilter(
  idCategory,
  size,
  color,
  minPrice,
  maxPrice,
  result
) {
  if (size.length > 0 && color.length > 0) {
    sql.query(
      "SELECT * FROM Products WHERE idCategory = ? AND size = ? AND color =  ? AND (priceOfProduct >= ? AND priceOfProduct <= ?)",
      [idCategory, size, color, minPrice, minPrice, maxPrice],
      function (err, res) {
        err ? result(err, null) : result(null, res);
      }
    );
  } else if (size.length > 0 && color.length <= 0) {
    sql.query(
      "SELECT * FROM Products WHERE idCategory = ? AND size = ? AND (priceOfProduct >= ? AND priceOfProduct <= ?)",
      [idCategory, size, minPrice, maxPrice],
      function (err, res) {
        err ? result(err, null) : result(null, res);
      }
    );
  } else if (size.length <= 0 && color.length > 0) {
    sql.query(
      "SELECT * FROM Products WHERE idCategory = ? AND color = ? AND (priceOfProduct >= ? AND priceOfProduct <= ?)",
      [idCategory, color, minPrice, maxPrice],
      function (err, res) {
        err ? result(err, null) : result(null, res);
      }
    );
  } else {
    sql.query(
      "SELECT * FROM Products WHERE idCategory = ? AND (priceOfProduct >= ? AND priceOfProduct <= ?) ",
      [idCategory, minPrice, maxPrice],
      function (err, res) {
        err ? result(err, null) : result(null, res);
      }
    );
  }
};

Product.getTrendingProducts = function getTrendingProducts(result) {
  sql.query("SELECT * FROM Products WHERE idCategory = 2 LIMIT 16", function (err, res) {
    err ? result(err, null) : result(null, res);
  });
};

Product.getListProductsOrdered = function getListProductsOrdered(idUser, result) {
  sql.query(
    "SELECT idOrder, idProduct, orderDate, shippedDate, status, quantityOrdered, productImages, unitPrice, nameOfProduct, priceOfProduct, size, color FROM orders t1 INNER JOIN orderdetails t2 ON t1.id = t2.idOrder INNER JOIN products t3 ON t2.idProduct = t3.id WHERE idUser = ? ORDER BY idOrder;",
    [idUser],
    function (err, res) {
      err ? result(err, null) : result(null, res);
    }
  );
};

Product.getProductById = function getProductById(idProduct, result) {
  sql.query("SELECT * FROM Products WHERE id = ?", [idProduct], function (err, res) {
    err ? result(err, null) : result(null, res);
  });
};

Product.findProductsByName = function findProductsByName(id, keyword, result) {
  sql.query(
    `SELECT * FROM Products WHERE nameOfProduct LIKE '%${keyword}%' AND idCategory=? LIMIT 5;`,
    [id],
    function (err, res) {
      err ? result(err, null) : result(null, res);
    }
  );
};

Product.searchProductsByName = function searchProductsByName(keyword, result) {
  sql.query(`SELECT * FROM Products WHERE nameOfProduct LIKE '%${keyword}%'`, function (err, res) {
    err ? result(err, null) : result(null, res);
  });
};

Product.getAllProduct = function getAllProduct(result) {
  sql.query(`SELECT * FROM Products`, function (err, res) {
    err ? result(err, null) : result(null, res);
  });
};

module.exports = Product;
