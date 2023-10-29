"user strict";
var sql = require("../db");

const GetAllTableName = (result) => {
  sql.query(
    "SELECT Table_name as TablesName from information_schema.tables where table_schema = 'fashion_shop';",
    function (err, res) {
      err ? result(err, null) : result(null, res);
    }
  );
};

module.exports = GetAllTableName;
