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

  codes += "PE";

  codes += align(3);

  // nth.FileHeader
  codes += "\x4c\x01";
  codes += "\02\00";
  codes += "\x9b\x5f\xa6\x4d";

  codes += align(9);

  // // nth.FileHeader.SizeOfOptionalHeader
  // codes += "\x23";

  // codes += "\x01\x02";

  // // nth.OptionalHeader
  // codes += "\x01\x0b";
  // codes += "\x0a";
  // codes += "\x02\00";
  // codes += "\x10\00";
  // codes += "\x10\00";
  // codes += "\x20\00";
  // codes += "\x40\00\00";
  // codes += "\x10\00";
  // codes += "\x02\00";
  // codes += "\x05";
  // codes += "\x01";
  // codes += "\x05";
  // codes += "\x01";
  // codes += "\x30\00";
  // codes += "\x02\00";
  // codes += "\x03";
  // codes += "\x10\00\00";
  // codes += "\00\x10\00";
  // codes += "\x10\00\00";
  // codes += "\00\x10\00";
  // codes += "\x16";
  // codes += "\00\00\x20\00";
  // codes += "\00\00\x10\00";

  return codes;
};
fs.writeFile("a.exe", main(), 'binary', function (err) {
  // console.log(data);
  // console.log(err);
});
