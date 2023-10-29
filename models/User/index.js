"user strict";
var sql = require("../db");

var User = function (user) {
  this.nameOfUser = user.nameOfUser;
  this.userName = user.userName;
  this.password = user.password;
  this.address = user.address;
  this.level = user.level;
  this.phoneNumber = user.phoneNumber;
};

User.createAUser = function createUser(newUser, result) {
  sql.query("INSERT INTO Users set ?", newUser, function (err, res) {
    if (err) {
      result(err, null);
    } else {
      result(null, res.userIdInsert);
    }
  });
};

User.getAUserByUserName = function getUserByUserName(userName, result) {
  const queryString = `SELECT * FROM Users WHERE userName = '${userName}'`;
  sql.query(queryString, function (err, res) {
    if (err) {
      result(err, null);
    } else {
      result(null, res);
    }
  });
};

User.getAUserById = function getUserById(userId, result) {
  const queryString = `SELECT * FROM Users WHERE id = ${userId}`;
  sql.query(queryString, function (err, res) {
    if (err) {
      result(err, null);
    } else {
      result(null, res);
    }
  });
};

// method getAllUser
User.getAllUser = function getAllUser(result) {
  const queryString = `SELECT * FROM Users WHERE 1`;
  sql.query(queryString, function (err, res) {
    err ? result(err, null) : result(null, res);
  });
};

// method updateAUser
User.updateAUser = function (id, user, result) {
  sql.query(
    "UPDATE Users SET nameOfUser = ?, userName = ?, password = ?, address = ?, level = ?, phoneNumber = ? WHERE id = ?",
    [user.nameOfUser, user.userName, user.password, user.address, user.level, user.phoneNumber, id],
    function (err, res) {
      err ? result(err, null) : result(null, res);
    }
  );
};

// method deleteAUser
User.deleteAUser = function deleteAUser(userId, result) {
  sql.query("DELETE FROM Users WHERE id = ?", [userId], function (err, res) {
    err ? result(err, null) : result(null, res);
  });
};

// method deleteAllUser
User.deleteAllUser = function deleteAllUser(result) {
  sql.query("DELETE * FROM Users WHERE 1", function (err, res) {
    err ? result(err, null) : result(null, res);
  });
};

module.exports = User;
