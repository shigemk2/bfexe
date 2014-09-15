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
  }
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

