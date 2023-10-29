"use strict";

module.exports = function (app) {
  const userList = require("../controllers/UserController");
  const productList = require("../controllers/ProductController");
  const categoryList = require("../controllers/CategoryController");
  const orderList = require("../controllers/OrderController");
  const orderDetailsList = require("../controllers/OrderDetailsController");
  const common = require("../controllers/Common");

  // common
  app.route("/app/get-all-table-name").get(common.getAllTableName);

  app.route("/users").get(userList.getAllUser);

  app.route("/user/:userName").get(userList.getAUserByUserName);
  app.route("/user/get-user-by-id/:userId").get(userList.getUserById);
  app.route("/user").put(userList.createNewUser);
  app.route("/user/:userId").delete(userList.deleteAUserById);
  app.route("/user/:userId/orders").get(userList.getListProductsOrdered);

  app.route("/products").get(productList.getAllProduct);
  app.route("/products/newest").get(productList.getListNewProducts);
  app.route("/product/:id").get(productList.getProductById);
  // url http://localhost:3001/products/filter?idCategory=1&size=m&color=blue
  app.route("/products/filter").get(productList.getProductsByFilter);
  app.route("/products/trending").get(productList.getTrendingProducts);
  app.route("/products/find").get(productList.findProductsByName);
  app.route("/products/search").get(productList.searchProductsByName);

  app.route("/categories").get(categoryList.getListCategories);

  app.route("/orders").get(orderList.getAllProductsOrdered);
  app.route("/order/add").put(orderList.addNewOrder);

  app.route("/order/newest").get(orderList.getNewestOrder);
  app.route("/order/add-new-order-details").put(orderDetailsList.addNewOrderDetails);
};
