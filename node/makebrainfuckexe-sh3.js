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
 * @return {String} ret lenの数ぶんの\0
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
 * @example "abc" という文字列があって、8の倍数ぶんだけ0詰めしたい場合は、align("abc", 8)とすると、"\0\0\0\0\0"が返ってくる
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


const IMAGEBASE = 0x10000;
const IDATA_RVA = 0x11000;

function makeidata(dlls) {
  var idata = "";
  // IDT, ILT, IAT, funcs, DLLs
  // (使いたいDLLの数+1)*20
  var idt_len = 20, ilt_len = 0, funcs_len = 0;
  // function name
  for (var dll in dlls) {
    idt_len += 20;
    ilt_len += (dlls[dll].length + 1) * 4;
    var fs = dlls[dll];
    // 文字列の長さを数えている(2でアラインメント)
    for (var i = 0; i < fs.length; i++) {
      funcs_len += (((2 + fs[i].length + 2) / 2) | 0) * 2;
    }
  }
  var ilt_rva   = IDATA_RVA + idt_len;
  var iat_rva   = ilt_rva + ilt_len;
  var funcs_rva = iat_rva + ilt_len;
  var dlls_rva  = funcs_rva + funcs_len;
  var ilt = "", funcs = "", dllnames = "", addrs = {};
  // idtとiltとiatとH/N Tableのidataを作成
  for (var dll in dlls) {
    idata += convLEs(4, [ilt_rva + ilt.length, 0, 0,
                         dlls_rva + dllnames.length,
                         iat_rva + ilt.length]);
    var fs = dlls[dll];
    for (var i = 0; i < fs.length; i++) {
      // あとの処理で使う。機械語の中には仮想アドレスを渡す必要がある
      addrs[fs[i]] = IMAGEBASE + iat_rva + ilt.length;
      ilt += convLE(4, funcs_rva + funcs.length);
      funcs += "\0\0" + fs[i] + "\0";
      funcs += align(funcs, 2);
    }
    ilt += convLE(4, 0);
    dllnames += dll + "\0";
  }
  idata += zero(5 * 4) + ilt + ilt + funcs + dllnames;
  return {"idata": idata, "addrs": addrs};
}

var idata = makeidata({"coredll.dll": ["putchar", "getchar", "exit"]});

var fs = require('fs');
var src = fs.readFileSync(process.argv[2], 'utf8');

var text = convLEs(2, [
  0xd804, // 11000: mov.l 0x11008,r8
  0xd905, // 11002: mov.l 0x1100c,r9  ! getchar
  0xda05, // 11004: mov.l 0x11010,r10 ! putchar
  0xdb06, // 11006: mov.l 0x11014,r11 ! exit
  0x6992, // 11008: mov.l @r9,r9
  0x6aa2, // 1100a: mov.l @r10,r10
  0x6bb2, // 1100c: mov.l @r11,r11
  0x0009, // 1100e: nop
  0xa008, // 11010: bra 0x1101c
  // 遅延スロット
  0x0009, // 11012:   nop
]) + convLEs(4, [
  /* 11014: */ 0x22000, /* 初期化 */
  /* 11018: */ idata.addrs.getchar,
  /* 1101c: */ idata.addrs.putchar,
  /* 11020: */ idata.addrs.exit
]);

var begin = [];
for (var pc = 0; pc < src.length; pc++) {
  switch (src[pc]) {
  case "+":
    text += convLEs(2, [
      0x6180, // mov.b   @r8,r1
      0x7101, // add     #1,r1
      0x2810, // mov.b   r1,@r8
    ]);
    break;
  case "-":
    text += convLEs(2, [
      0x6180, // mov.b   @r8,r1
      0x71ff, // add     #-1,r1
      0x2810, // mov.b   r1,@r8
    ]);
    break;
  case ">":
    text += convLEs(2, [
      0x7801, // add     #1,r8
    ]);
    break;
  case "<":
    text += convLEs(2, [
      0x78ff, // add     #-1,r8
    ]);
    break;
  case ".":
    text += convLEs(2, [
      0x4a0b, // jsr @r10
      0x6480, //   mov.b @r8,r4
    ]);
    break;
  case ",":
    text += convLEs(2, [
      0x490b, // jsr @r9
      0x6480, //   mov.b @r8,r4
    ]);
    break;
  // case "[":
  //   begin.push(text.length);
  //   text += "\x80\x3e\x00";             // cmp type ptr[esi], 0
  //   text += "\x0f\x84" + zero(4);       // jz near ????
  //   break;
  // case "]":
  //   var ad1 = begin.pop();
  //   var ad2 = text.length + 5;
  //   text = text.substring(0, ad1 + 5) +
  //       convLE(4, ad2 - (ad1 + 9)) +
  //       text.substring(ad1 + 9);
  //   text += "\xe9" + convLE(4, ad1 - ad2); // jmp near begin
  //   break;
  }
}

text += convLEs(2, [
  0x4b0b, // jsr @r11
  0xe400  //   mov #0,r4
]);

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
codes += convLEs(2, [0x1a2/*SH-3*/, 3]);
codes += convLEs(4, [0x4da65f9b, 0, 0]);
codes += convLEs(2, [0xe0, 0x102]);

// nth.OptionalHeader
codes += convLE (2, 0x10b);
codes += convLEs(1, [10, 0]);
// CEのImageBaseのデフォルトは0x10000
codes += convLEs(4, [0x10000, 0, 0, 0x1000, 0x1000, 0x11000,
                     IMAGEBASE, 0x1000, 0x200]);
codes += convLEs(2, [2, 11, 0, 0, 2, 11]);
codes += convLEs(4, [0, 0x1a000, 0x0200, 0]);
codes += convLEs(2, [9/*CE*/, 0]);
codes += convLEs(4, [0x100000, 0x10000, 0x100000, 0x1000, 0, 16]);
codes += convLEs(4, [0, 0, 0x11000, idata.idata.length]);
codes += zero(14 * 8);

// sects .text
codes += ".text";
codes += align(codes, 8);
codes += convLEs(4, [text.length, 0x1000, 0x10000, 0x200, 0, 0]);
codes += convLEs(2, [0, 0]);
codes += convLE (4, 0x60000020);

// sects .idata
codes += ".idata";
codes += align(codes, 8);
codes += convLEs(4, [idata.idata.length, IDATA_RVA, 0x0200, 0x10200, 0, 0]);
codes += convLEs(2, [0, 0]);
codes += convLE (4, 0xc0300040);

// sects .bss
codes += ".bss";
codes += align(codes, 8);
// メモリ上のサイズ bfのメモリは30000
codes += convLEs(4, [30000, 0x12000, 0, 0, 0, 0]);
codes += convLEs(2, [0, 0]);
codes += convLE (4, 0xc0600080);

codes += align(codes, 0x0200);

// .text
codes += text;
codes += zero(0x10200 - codes.length);

// .idata
codes += idata.idata;
codes += align(codes, 0x0200);

fs.writeFileSync("sh3-b.exe", codes, "binary");

