// import 'dart:convert';
// import 'dart:io';
// import 'dart:math';
// import 'dart:typed_data';
//
// import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';
//
// class FileUtils {
//   static Future<Uint8List> compressFile(Uint8List image, int maxWidth) async {
//     var result = await FlutterImageCompress.compressWithList(image,
//         quality: ConstantsUtils.IMAGE_QUALITY, minWidth: 400);
//     return result;
//   }
//
//   static Future<Uint8List> compressFile2(Uint8List img, int maxWidth) async {
//     Image? image = decodeImage(img.buffer.asUint8List());
//     if (image != null) {
//       Image imageResize = copyResize(image, width: 400);
//       return Uint8List.fromList(encodePng(imageResize));
//     }
//     return Uint8List(0);
//   }
//
//   static Future<bool> saveImage(String url) async {
//     final xFile = await getXFileFromUrl(url);
//     final response = await GallerySaver.saveImage(xFile.path);
//     return response!;
//   }
//
//   static String base64EncodeFormat(Uint8List image) {
//     String format = 'data:image/jpeg;base64,';
//     String data = base64Encode(image);
//     return format + data;
//   }
//
//   static Map<String, dynamic> removeNull(Map<String, dynamic> map) {
//     map.removeWhere((key, value) => value == null);
//     return map;
//   }
//
//   static Future<Uint8List> readByteFromUrl(String url) async {
//     http.Response response = await http.get(Uri.parse(url));
//     final bytes = response.bodyBytes;
//     return bytes;
//   }
//
//   static Future<File> writeToFile(Uint8List data, String path) {
//     return File(path).writeAsBytes(data);
//   }
//
//   static Future<XFile> getXFileFromUrl(String url) async {
//     final regexp = RegExp(r'\w+.jpeg');
//     final dir = await getApplicationDocumentsDirectory();
//     final getFileName = regexp.firstMatch(url)?.group(0);
//     String path = '${dir.path}/$getFileName';
//     final bytes = await FileUtils.readByteFromUrl(url);
//     await FileUtils.writeToFile(bytes, path);
//     XFile tmp = XFile(path);
//     return tmp;
//   }
//
//   static Future<String> getBase64FromXFile(XFile xFile, int maxWidth) async {
//     var sourceBytes = await xFile.readAsBytes();
//     var largeBytes = await FileUtils.compressFile(sourceBytes, maxWidth);
//     // var largeBytes2 = await FileUtils.compressFile2(sourceBytes, maxWidth);
//     String base64Large = FileUtils.base64EncodeFormat(largeBytes);
//     return base64Large;
//   }
//
//   static Future<String> getFilePath(String fileName) async {
//     Directory appDocumentsDirectory =
//         await getApplicationDocumentsDirectory(); // 1
//     String appDocumentsPath = appDocumentsDirectory.path; // 2
//     String filePath = '$appDocumentsPath/$fileName'; // 3
//     return filePath;
//   }
//
//   static Future<double> getFileSizeAsKB(
//       {Uint8List? img, String? filepath, int? decimals}) async {
//     int bytes;
//     if (img != null) {
//       bytes = img.lengthInBytes;
//     } else {
//       var file = File(filepath!);
//       bytes = await file.length();
//     }
//     if (bytes <= 0) return 0;
//     // const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
//     var i = (log(bytes) / log(1024)).floor();
//     return (bytes / pow(1024, i));
//     //return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + ' ' + suffixes[i];
//   }
// }
