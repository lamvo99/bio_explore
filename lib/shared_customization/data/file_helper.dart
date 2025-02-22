// // Dart imports:
// import 'dart:io';
// import 'dart:typed_data';
//
// // Package imports:
// import 'package:dio/dio.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:path_provider/path_provider.dart';
//
// // Project imports:
// import 'package:s_booking/app_common_data/common_data/global_variable.dart';
// import 'package:s_booking/services/export.dart';
//
// class FileHelpers {
//
//   final _helperRepo = HelperRepository(apis: apis);
//
//
//   Future<String> uploadImage(File image) async {
//     try {
//       String fileName = image.path.split('/').last;
//       FormData formData = FormData();
//       formData.files.add(
//         MapEntry(
//             'file', MultipartFile.fromFileSync(image.path, filename: fileName)),
//       );
//       ApiResponse response = await _helperRepo.storages(data: formData);
//       return response.data;
//     }catch (e) {
//       rethrow;
//     }
//   }
//
//   Future<List<String>> uploadMultipleImage(List<File> images) async {
//     try {
//       FormData formData = FormData();
//
//       images.forEach((file) async {
//         String fileName = file.path.split('/').last;
//         formData.files.add(MapEntry(
//           'files',
//           MultipartFile.fromFileSync(file.path, filename: fileName),
//         ));
//       });
//       ApiResponse response =
//       await _helperRepo.storagesMultiple(data: formData);
//
//       List<dynamic> list = response.data;
//       List<String> stringList =
//       list.map((element) => element.toString()).toList();
//       return stringList;
//     }catch (e) {
//       rethrow;
//     }
//   }
//
//   Future<bool> saveFileToLocal(String url, String fileName) async {
//     try {
//       final dio = Dio();
//       final response = await dio.get(
//         url,
//         options: Options(responseType: ResponseType.bytes), // Yêu cầu trả về dưới dạng mảng byte
//       );
//       await ImageGallerySaver.saveImage(response.data, quality: 100);
//       // await Permission.storage.request();
//       // String localPath = await findLocalPath();
//       // final filePath = '$localPath/$fileName';
//       // final File imageFile = await File(filePath).create(recursive: true);
//       // await imageFile.writeAsBytes(response.data);
//       return true;
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   Future<bool> saveBytesToLocal(Uint8List data) async {
//     try {
//       final result =
//       await ImageGallerySaver.saveImage(data, quality: 100, name: "SBooking-QR");
//       // await Permission.storage.request();
//       // String localPath = await findLocalPath();
//       // final filePath = '$localPath/SBooking-QR.png';
//       // final File imageFile = await File(filePath).create(recursive: true);
//       // await imageFile.writeAsBytes(data.toList());
//       return true;
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   Future<String> findLocalPath() async {
//     if (Platform.isAndroid) {
//       return "/storage/emulated/0/Download";
//     } else {
//       var directory = await getApplicationDocumentsDirectory();
//       return directory.path;
//     }
//   }
// }
