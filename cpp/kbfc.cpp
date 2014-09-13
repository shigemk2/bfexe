#include <stdio.h>
#include <string>
#include <vector>
#include <stack>
#include <windows.h> // PE関連の構造体のため
 
int addr_putchar = 0x00405044;
int addr_getchar = addr_putchar + 4;
int addr_buf = 0x00406000;
 
// グローバル変数はゼロクリアされる
unsigned char bin[16 * 1024]; // 出力バイナリ
 
// 出力用関数のプロトタイプ宣言
std::string Path_ChangeExtension(const std::string &path, const std::string &ext);
void WritePEHeader(FILE *fp);
void WriteIData(FILE *fp);
 
int main(int argc, char* argv[])
{
std::vector<char> order; // 実行する命令を保存する動的配列
std::stack<int> loops; // ループを保存するスタック
int order_end = 0; // 実行する命令の数を保存する
char *filename; // ファイル名を保存する
 
// コマンドライン引数が正しく設定されているのか、チェックする処理
if (argc != 2)
{
#ifndef _DEBUG
printf("コマンドライン引数の数が不正です。1つのファイルを指定して下さい\n");
return 1;
#else
// デバッグ用にテストファイルを決め打ち
filename = "test.bf";
#endif
}
else
{
// argvの第1引数から、ファイル名を取り出す
filename = argv[1];
}
 
// ソースを開く
FILE *fp1 = fopen(filename, "rb");
if (!fp1)
{
printf("ソースを開けません: %s\n", filename);
return 1;
}
 
// ソースの内容を配列にコピー
// 実行する命令の数をorder_endに代入する
if (fseek(fp1, 0, SEEK_END) == 0)
{
int size = ftell(fp1);
if (fseek(fp1, 0, SEEK_SET) == 0)
{
order.resize(size);
order_end = fread(&order[0], 1, size, fp1);
}
}
fclose(fp1);
 
// バイナリ: ポインタの初期化
int idx = 0; // 出力バイナリのインデックス
bin[idx] = 0x31; bin[idx + 1] = 0xc9; // xor ecx, ecx
bin[idx + 2] = 0x57; // push edi
bin[idx + 3] = 0xbf; *(int*)&bin[idx + 4] = addr_buf; // mov edi, addr_buf
idx += 8;
 
//命令ポインタが指す値が、order_endに達しない限りループする
for (int order_ptr = 0; order_ptr < order_end; order_ptr++)
{
//配列の要素に従って、命令の分岐を行う
switch(order[order_ptr])
{
//Brainfuckの各命令の処理
case '>':
bin[idx] = 0x66; bin[idx + 1] = 0x41; // inc cx
idx += 2;
break;
case '<':
bin[idx] = 0x66; bin[idx + 1] = 0x49; // dec cx
idx += 2;
break;
case '+':
bin[idx] = 0xfe; bin[idx + 1] = 0x04; bin[idx + 2] = 0x0f; // inc byte [edi+ecx]
idx += 3;
break;
case '-':
bin[idx] = 0xfe; bin[idx + 1] = 0x0c; bin[idx + 2] = 0x0f; // dec byte [edi+ecx]
idx += 3;
break;
case '.':
bin[idx] = 0x51; // push ecx
*(int*)&bin[idx + 1] = 0x0f04b60f; // movzx eax,byte [edi+ecx]
bin[idx + 5] = 0x50; // push eax
bin[idx + 6] = 0xa1; *(int*)&bin[idx + 7] = addr_putchar; // mov eax, [addr_putchar]
bin[idx + 11] = 0xff; bin[idx + 12] = 0xd0; // call eax
bin[idx + 13] = 0x58; // pop eax
bin[idx + 14] = 0x59; // pop ecx
idx += 15;
break;
case ',':
bin[idx] = 0x51; // push ecx
bin[idx + 1] = 0xa1; *(int*)&bin[idx + 2] = addr_getchar; // mov eax, [addr_getchar]
bin[idx + 6] = 0xff; bin[idx + 7] = 0xd0; // call eax
bin[idx + 8] = 0x59; // pop ecx
bin[idx + 9] = 0x88; bin[idx + 10] = 0x04; bin[idx + 11] = 0x0f; // mov [edi+ecx],al
idx += 12;
break;
// ループの先頭。命令ポインタの指す値が0である場合、ループの末尾にジャンプ
case '[':
loops.push(idx); // インデックスをスタックに積む
*(int*)&bin[idx] = 0x000f3c80; // cmp byte [edi+ecx],0
bin[idx + 4] = 0x0f; bin[idx + 5] = 0x84; // jz 対応する]の直後（アドレスは後で決定）
idx += 10;
break;
// ループの末尾。ループの先頭にジャンプ
case ']':
{
if (loops.size() == 0)
{
printf("対応する [ がありません。\n");
return 1;
}
int idx_loop = loops.top();
loops.pop();
bin[idx] = 0xe9; *(int*)&bin[idx + 1] = idx_loop - (idx + 5); // jmp idx_loop
idx += 5;
// ループの先頭を書き換え
*(int*)&bin[idx_loop + 6] = idx - (idx_loop + 10);
break;
}
}
if (idx > sizeof(bin) - 32)
{
printf("出力サイズ超過のためコンパイルを中止します。\n");
return 1;
}
}
 
if (loops.size() > 0)
{
printf("対応する ] がありません。\n");
return 1;
}
 
// バイナリ: 終了処理
bin[idx] = 0x5f; // pop edi
bin[idx + 1] = 0x31; bin[idx + 2] = 0xc0; // xor eax, eax
bin[idx + 3] = 0xc3; // ret
idx += 4;
 
// 出力するバイナリのファイル名を作成する ex. test.bf → test.exe
std::string exe = Path_ChangeExtension(filename, ".exe");
 
// 出力ファイルを開く
FILE *fp2 = fopen(exe.c_str(), "wb");
if (!fp2)
{
printf("出力ファイルを開けません: %s\n", exe.c_str());
return 1;
}
 
// バイナリを出力
WritePEHeader(fp2); // ヘッダ出力
WriteIData(fp2); // .idataセクション出力
fwrite(bin, sizeof(bin), 1, fp2);
fclose(fp2);
 
// 終了前の後処理。
printf("brainfuckのバイナリを出力しました: %s\n", exe.c_str());
return 0;
}
 
// 出力用関数
 
std::string Path_ChangeExtension(const std::string &path, const std::string &ext)
{
for (int i = path.length() - 1; i >= 0; i--)
{
switch (path[i])
{
case '.': return path.substr(0, i) + ext;
case '/': case '\\': break;
}
}
return path + ext;
}
 
void WriteShort(FILE *fp, short v)
{
fwrite(&v, sizeof(v), 1, fp);
}
 
void WriteString(FILE *fp, int size, const char *str)
{
std::vector<char> buf(size);
for (int i = 0; i < size && str[i]; i++) buf[i] = str[i];
fwrite(&buf[0], size, 1, fp);
}
 
unsigned char stub[] =
{
// 00-3b: DOS Header
'M', 'Z', 0x50, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x0f, 0x00, 0xff, 0xff, 0x00, 0x00,
0xb8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x1a, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
// 3c-3f: Pointer to PE Header (=80)
0x80, 0x00, 0x00, 0x00,
// 40-7f: DOS Stub
0xba, 0x10, 0x00, 0x0e, 0x1f, 0xb4, 0x09, 0xcd, 0x21, 0xb8, 0x01, 0x4c, 0xcd, 0x21, 0x90, 0x90,
'T', 'h', 'i', 's', ' ', 'p', 'r', 'o', 'g', 'r', 'a', 'm', ' ', 'c', 'a', 'n',
'n', 'o', 't', ' ', 'b', 'e', ' ', 'r', 'u', 'n', ' ', 'i', 'n', ' ', 'D', 'O',
'S', ' ', 'm', 'o', 'd', 'e', '.', '\r', '\n', '$', 0, 0, 0, 0, 0, 0,
// 80-83: PE Signature
'P', 'E', 0, 0
};
 
void WritePEHeader(FILE *fp)
{
fwrite(stub, sizeof(stub), 1, fp);
 
IMAGE_FILE_HEADER coff =
{
0x014c, 3, 0, 0, 0, sizeof(IMAGE_OPTIONAL_HEADER32), 0x030f
};
fwrite(&coff, sizeof(coff), 1, fp);
 
IMAGE_OPTIONAL_HEADER32 opt =
{
0x010b, // Magic
6, 0, // MajorLinkerVersion, MinorLinkerVersion
sizeof(bin), // SizeOfCode
0, // SizeOfInitializedData
65536, // SizeOfUninitializedData
0x1000, // AddressOfEntryPoint
0x1000, // BaseOfCode
0x6000, // BaseOfData
0x00400000, // ImageBase
0x1000, // SectionAlignment
0x0200, // FileAlignment
4, 0, // MajorOperatingSystemVersion, MinorOperatingSystemVersion
0, 0, // MajorImageVersion, MinorImageVersion
4, 0, // MajorSubsystemVersion, MinorSubsystemVersion
0, // Win32VersionValue
0x16000, // SizeOfImage
0x200, // SizeOfHeaders
0, // CheckSum
3, // Subsystem
0, // DllCharacteristics
1024 * 1024, // SizeOfStackReserve
8 * 1024, // SizeOfStackCommit
1024 * 1024, // SizeOfHeapReserve
4 * 1024, // SizeOfHeapCommit
0, // LoaderFlags
16 // NumberOfRvaAndSizes
};
memset(opt.DataDirectory, 0, sizeof(opt.DataDirectory));
opt.DataDirectory[1].VirtualAddress = 0x5000; // import table
opt.DataDirectory[1].Size = 100;
fwrite(&opt, sizeof(opt), 1, fp);
 
IMAGE_SECTION_HEADER sects[3];
memset(sects, 0, sizeof(sects));
strcpy((char *)sects[0].Name, ".text");
sects[0].Misc.VirtualSize = sizeof(bin);
sects[0].VirtualAddress = 0x1000;
sects[0].SizeOfRawData = sizeof(bin);
sects[0].PointerToRawData = 0x400;
sects[0].Characteristics = 0x60500060;
strcpy((char *)sects[1].Name, ".idata");
sects[1].Misc.VirtualSize = 100;
sects[1].VirtualAddress = 0x5000;
sects[1].SizeOfRawData = 512;
sects[1].PointerToRawData = 0x200;
sects[1].Charactrcpy((char *)sects[2].Name, ".bss");
sects[2].Misc.VirtualSize = 65536;
sects[2].VirtualAddress = 0x6000;
sects[2].Characteristics = 0xc0400080;
fwrite(sects, sizeof(sects), 1, fp);
 
std::vector<char> pad(0x200 - ftell(fp));
fwrite(&pad[0], pad.size(), 1, fp);
}
 
void WriteIData(FILE *fp)
{
int idt[] =
{
// IDT 1
0x5028, 0, 0, 0x5034, 0x5044,
// IDT (終端)
0, 0, 0, 0, 0
};
fwrite(idt, sizeof(idt), 1, fp);
int ilt_iat[] = { 0x5050, 0x505a, 0 };
fwrite(ilt_iat, sizeof(ilt_iat), 1, fp); // ILT
WriteString(fp, 16, "msvcrt.dll");
 
fwrite(ilt_iat, sizeof(ilt_iat), 1, fp); // IAT
 
// putchar
WriteShort(fp, 0);
WriteString(fp, 8, "putchar");
 
// getchar
WriteShort(fp, 0);
WriteString(fp, 8, "getchar");
 
std::vector<char> pad(0x400 - ftell(fp));
fwrite(&pad[0], pad.size(), 1, fp);
}
