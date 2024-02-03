const con = require("../config/database");
const table = require("../config/tables");
const utils = require("../common/utils");


exports.Registration = async (req, res) => {
  const {FirstName,LastName,Email,Password,Address,Number,Image,DateOfBirth,Gender} = req.body;
  console.log(req.body)
  var image_file = req.files;
  if (image_file != undefined && image_file.length > 0) {
    var image_name = req.files[0].originalname;
    var url =
      utils.getStoreImageFolderPath(FOLDER_NAME.USER_PROFILES) +
      image_name;
    requestData.Image = url;
    utils.storeImageToFolder(
      image_file[0].path,
      image_name ,
      FOLDER_NAME.USER_PROFILES,
    );
  
  }
  utils.cryptPassword(Password).then(
    (EncryptedPassword)=>{
      const sql =
        `INSERT INTO ${table.employeeregistration} (FirstName, LastName, Email, Password, Address, Number,Image,DateOfBirth,Gender)` +
        ` VALUES ('${FirstName}', '${LastName}', '${Email}', '${EncryptedPassword}', '${Address}', '${Number}','${Image}','${DateOfBirth}','${Gender}')`;
      con.query(sql, (err, results) => {
        if (err) {
          console.log(err)
          return res.status(400).json({
            success: false,
            message: `Server Internal error`,
            error: err,
          });
        }
        console.log(EncryptedPassword)
        return res.status(200).json({
          success: true,
          status: 200,
          message: "create Account successfully",
          result: results,
        });
      });

  }).catch((err) => {
    return res.status(500).json({
      success: false,
      message: `Error while returning hash password`,
      error: err
    }) 
  })
  
};


exports.userLogin = async (req, res) => {
  utils.check_request_params(
    req.body,
    [
      { name: "Email", type: "string" },
      { name: "Password", type: "string" },
    ],
    function (response) {
      if (response.success) {
        const postData = req.body;
        console.log(postData)
        const sql = `SELECT * FROM ${table.employeeregistration} WHERE Email='${postData.Email}'`;
        con.query(sql, async (err, results) => {
          console.log(err)
          if (err) {
            return res.status(401).send({
              success: false,
              message: `user not valid`,
              error: err,
            });
          }
          if (results.length > 0) {
            // console.log(results[0].Password,postData.Password)
           
            const checkPass = await utils.comparePassword(
              postData.Password,
              results[0].Password,
              results[0]
            );
            // res.setHeader("auth", checkPass);
            console.log(checkPass)
            return res.status(checkPass ? 200 : 400).send({
              success: checkPass ? true : false,
              status: checkPass ? 200 : 400,
              message: checkPass ? `Logged in succesfully` : "Invalid Password",
              result: checkPass ? results[0] : {},
              token: checkPass,
            });
          } else {
            return res.status(400).send({
              success: false,
              status: 400,
              message: "Invalid Email",
            });
          }
        });
      } else {
        res.json(response);
      }
    }
  );
};


exports.getEmployeeFromTechnology = async (req, res) => {
  const sql = `SELECT * FROM ${table.employeeregistration} WHERE Technology="${req.body.Technology}"`;
  con.query(sql, (err, results) => {
    if (err) {
      return res.status(400).json({
        success: false,
        message: `Server Internal error`,
        error: err,
      });
    }
    return res.status(200).json({
      success: true,
      status: 200,
      message: "Task detail",
      result: results,
    });
  });
}


