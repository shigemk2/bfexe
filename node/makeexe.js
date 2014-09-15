var fs = require("fs");

/**
 * 指定されたlenだけバイト文字列vをリトルエンディアン変換する
 * LEはリトルエンディアンの意
 *
 * @method convLE
 * @param {Int} len バイト数
 * @param {ByteString} v バイト文字列
 * @return {String} ret リトルエンディアン変換されたバイト文字列
 */
function convLE(len, v) {
  var ret = "";
  for(var i = 0; i < len; i++) {
    ret += String.fromCharCode(v & 0xff);
    v >>= 8;
  }
  return ret;
}

/**
 * 指定されたlenだけバイト文字列vをリトルエンディアン変換する 配列版
 * LEはリトルエンディアンの意
 *
 * @method convLEs
 * @param {Int} len バイト数
 * @param {Array} vs バイト文字列の配列
 * @return {String} ret リトルエンディアン変換されたバイト文字列
 */
function convLEs(len, vs) {
  var ret = "";
  for (var i = 0; i < vs.length; i++) {
    ret += convLE(len, vs[i]);
  }
  return ret;
}

/**
 * 指定されたlenだけ0を返す
 *
 * @method zero
 * @param {Int} len 桁数
 * @return {String} ret lenの数ぶんの0
 */
function zero(len) {
  var ret = "";
  for (var i = 0; i < len; i++) {
    ret += "\0";
  }
  return ret;
}

/**
 * aの倍数ぶん0詰めする
 *
 * @example "abc" という文字列があって、8の倍数ぶんだけ0詰めしたい場合は、align("abc", 8)とすると、"abc00000"が返ってくる
 *
 * @method align
 * @param {String} bytes 文字列
 * @param {Int} a 倍数
 * @return {String} ret 倍数分だけ0詰めされた文字列
 */
function align(bytes, a) {
  var m = bytes.length % a;
  if (m == 0) return "";
  return zero(a - m);
}

var idata = "";

// idata(idt ilt iat putchar dllname部分)のバイナリを出力する
// idt
idata += convLEs(4, [0x2028, 0, 0, 0x2042, 0x2030]);
idata += zero(5 * 4);

// ilt
idata += convLEs(4, [0x2038, 0]);

// iat
var putchar = 0x402000 + idata.length;
idata += convLEs(4, [0x2038, 0]);

// putchar
idata += convLE(2, 0);
idata += "putchar\0";

// DLL name
idata += "msvcrt.dll\0";

// EXEの実際の処理部分
var text = "";
text += "\x6a\x41";         // push 0x41
text += "\xff\x15";         // call [putchar]
text += convLE(4, putchar);
text += "\x58";             // pop eax
text += "\xc3";             // ret

// バイナリ出力
// codesの中身をファイルに出力する
// 先にidataやtextを定義したのはそれらのlengthを使うから
var codes = "";

// DOS Header
codes += "MZ";
codes += convLEs(2, [0x90, 3, 0, 4, 0, 0xffff, 0, 0xb8, 0, 0, 0x40]);

// PE offset
codes += zero(0x3c - codes.length);
codes += convLE(4, 0x80);

// DOS stub
codes += "\x0e";         // push cs
codes += "\x1f";         // pop ds
codes += "\xba\x0e\x00"; // mov dx, 0xe
codes += "\xb4\x09";     // mov ah, 9
codes += "\xcd\x21";     // int 0x21
codes += "\xb8\x01\x4c"; // mov ax, 0x4c01
codes += "\xcd\x21";     // int 0x21
codes += "This program cannot be run in DOS mode.\r\r\n$";

codes += align(codes, 0x80);

// nth.FileHeader
codes += "PE\0\0";
codes += convLEs(2, [0x14c, 2]);
codes += convLEs(4, [0x4da65f9b, 0, 0]);
codes += convLEs(2, [0xe0, 0x102]);

// nth.OptionalHeader
codes += convLE (2, 0x10b);
codes += convLEs(1, [10, 0]);
codes += convLEs(4, [0x0200, 0, 0, 0x1000, 0x1000, 0x2000,
                     0x400000, 0x1000, 0x200]);
codes += convLEs(2, [5, 1, 0, 0, 5, 1]);
codes += convLEs(4, [0, 0x3000, 0x0200, 0]);
codes += convLEs(2, [3, 0]);
codes += convLEs(4, [0x100000, 0x1000, 0x100000, 0x1000, 0, 16]);
codes += convLEs(4, [0, 0, 0x2000, idata.length]);
codes += zero(14 * 8);

// sects .text
codes += ".text";
codes += align(codes, 8);
codes += convLEs(4, [text.length, 0x1000, 0x0200, 0x0200, 0, 0]);
codes += convLEs(2, [0, 0]);
codes += convLE (4, 0x60000020);

// sects .idata
codes += ".idata";
codes += align(codes, 8);
codes += convLEs(4, [idata.length, 0x2000, 0x0200, 0x0400, 0, 0]);
codes += convLEs(2, [0, 0]);
codes += convLE (4, 0xc0300040);

codes += align(codes, 0x200);

// .text
codes += text;
codes += align(codes, 0x0200);

// .idata
codes += idata;
codes += align(codes, 0x0200);

fs.writeFileSync("a.exe", codes, "binary");

