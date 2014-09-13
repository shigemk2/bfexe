var fs = require('fs');

function main() {
  function align(size) {
    var aligned = "";
    for(var i = 0; i < size - 1; i++) {
      aligned += "\00";
    }
    return aligned;
  }
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

  codes += "\x0e\x1f";
  codes += "\xba\x0e";
  codes += "\x00\xb4";
  codes += "\x09\xcd";
  codes += "\x21\xb8";
  codes += "\x01\x4c";
  codes += "\xcd\x21";

  codes += "This program cannot be run in DOS mode.\r\r\n$";

  codes += align(8);

  return codes;
};
fs.writeFile("a.exe", main(), 'binary', function (err) {
  // console.log(data);
  // console.log(err);
});
