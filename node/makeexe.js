var fs = require('fs');

function main() {
  var codes = "";
  codes += "MZ";
  codes += "\x90";
  codes += "\00\03";
  codes += "\00\00";
  codes += "\00\04";
  codes += "\00";
  codes += "\00\00";
  codes += "\xff\xff";
  codes += "\00\00";
  codes += "\xb8";
  codes += "\00";
  codes += "\00\00";
  codes += "\00\00";
  codes += "\x40";
  codes += "\00";
  codes += "\00\00";
  codes += "\00\00";
  codes += "\00\00";
  codes += "\00\00";
  codes += "\00\00";
  codes += "\00\00";
  codes += "\00\00";
  codes += "\00\00";
  codes += "\00\00";
  codes += "\00\00";
  codes += "\00\00";
  codes += "\00\00";
  codes += "\00\00";
  codes += "\00\00";
  codes += "\00\00";
  codes += "\00\00";
  codes += "\00\00";
  codes += "\00\00";
  codes += "\x80";
  codes += "\00";
  codes += "\00\00";
  return codes;
};
fs.writeFile("a.exe", main(), 'binary', function (err) {
  // console.log(data);
  // console.log(err);
});
