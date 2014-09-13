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

  // nth.FileHeader.SizeOfOptionalHeader
  codes += "\xe0\00";

  codes += "\x02\x01";

  // nth.OptionalHeader
  codes += "\x0b\x01";
  codes += "\x0a\00";
  codes += "\00\x02";

  codes += align(11);
  codes += "\00\x10";
  codes += align(3);
  codes += "\00\x10";
  codes += align(3);
  codes += "\00\x20";
  codes += align(5);
  codes += "\x40\00\00";
  codes += "\x10\00\00";
  codes += "\00\x02";
  codes += align(3);
  codes += "\x05\00";
  codes += "\x01\00";
  codes += align(5);
  codes += "\x05\00";
  codes += "\x01\00";
  codes += align(5);
  codes += "\00\x30";
  codes += align(3);
  codes += "\00\x02";
  codes += align(7);
  codes += "\x03\00";
  codes += align(3);
  codes += "\00\00\x10\00";
  codes += "\00\x10";
  codes += align(5);
  codes += "\x10\00\00";
  codes += "\x10\00\00";
  codes += align(5);
  codes += "\x10\00";
  codes += align(11);
  codes += "\00\x20\00\00";
  codes += "\x10\00\00\00";

  codes += align(9);

  codes += align(105);

  // sects text
  codes += ".text";

  codes += align(4);

  codes += "\x34\00";
  codes += align(3);
  codes += "\00\x10";
  codes += align(3);
  codes += "\00\x02";
  codes += align(3);
  codes += "\00\x02";

  codes += align(15);
  codes += "\x20\00\00\x60";

  codes += ".idata";
  codes += align(3);
  codes += "\x54\00";
  codes += align(3);
  codes += "\00\x20";
  codes += align(3);
  codes += "\00\x02";
  codes += align(3);
  codes += "\00\x04";
  codes += align(15);
  codes += "\x40\00\x30\xc0";

  codes += align(57);

  codes += "\x6a\x41\xff\x15\x30\x20\x40\00\x58\xc3";

  // align
  codes += align(503);

  // idt
  codes += "\x28\x20";
  codes += align(11);
  codes += "\x48\x20";
  codes += align(3);
  codes += "\x30\x20";
  codes += align(23);

  // ilt iat
  codes += "\x38\x20";
  codes += align(7);
  codes += "\x38\x20";
  codes += align(9);

  return codes;
};
fs.writeFile("a.exe", main(), 'binary', function (err) {
  // console.log(data);
  // console.log(err);
});
