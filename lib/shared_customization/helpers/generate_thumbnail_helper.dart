// // Dart imports:
// import 'dart:async';
// import 'dart:io';
//
// // Flutter imports:
// import 'package:flutter/material.dart';
//
// // Package imports:
// import 'package:path_provider/path_provider.dart';
//
// // Project imports:
//
// class ThumbnailResult {
//   final Image image;
//   final int? dataSize;
//   final int? height;
//   final int? width;
//
//   const ThumbnailResult({
//     required this.image,
//     this.dataSize,
//     this.height,
//     this.width,
//   });
// }
//
// class VideoThumbnailCache {
//   static final Map<String, ThumbnailResult> _cache = {};
//
//   static Future<ThumbnailResult> getThumbnail(
//       File? file, String? url, double width, double height) async {
//     final key = '${file?.path ?? url}_$width$height';
//
//     if (_cache.containsKey(key)) {
//       return _cache[key]!;
//     }
//
//     final result = await generateThumbnailItem(file, url, width, height);
//     _cache[key] = result;
//     return result;
//   }
// }
//
// Future<ThumbnailResult> generateThumbnailItem(
//     File? file, String? url, double width, double height) async {
//   try {
//     if (file != null) {
//       final uint8list = await VideoThumbnail.thumbnailData(
//         video: file.path,
//         imageFormat: ImageFormat.JPEG,
//         maxWidth: width.toInt(),
//         maxHeight: height.toInt(),
//         quality: 75,
//       );
//
//       if (uint8list == null) {
//         throw Exception("Failed to generate thumbnail data.");
//       }
//
//       final imageDataSize = uint8list.length;
//       final image = Image.memory(
//         uint8list,
//         fit: BoxFit.cover,
//         width: width.toDouble(),
//         height: height.toDouble(),
//       );
//
//       return ThumbnailResult(
//         image: image,
//         dataSize: imageDataSize,
//         height: height.toInt(),
//         width: width.toInt(),
//       );
//     } else if (url.isNotEmptyOrNull) {
//       final fileName = await VideoThumbnail.thumbnailFile(
//         video: url!,
//         thumbnailPath: (await getTemporaryDirectory()).path,
//         imageFormat: ImageFormat.WEBP,
//         maxHeight: height.toInt(),
//         maxWidth: width.toInt(),
//         quality: 75,
//       );
//
//       if (fileName == null) {
//         throw Exception("Failed to generate thumbnail file.");
//       }
//
//       final image = Image.file(
//         File(fileName),
//         fit: BoxFit.cover,
//         width: width.toDouble(),
//         height: height.toDouble(),
//       );
//
//       return ThumbnailResult(
//         image: image,
//         height: height.toInt(),
//         width: width.toInt(),
//       );
//     }
//   } catch (e) {
//     print("Error generating thumbnail: $e");
//   }
//
//   // Fallback to default thumbnail
//   return ThumbnailResult(
//     image: Image.asset(
//       'assets/images/video_thumbnail.png',
//       height: height.toDouble(),
//       width: width.toDouble(),
//       fit: BoxFit.cover,
//     ),
//   );
// }
//
// class VideoThumbnailWidget extends StatefulWidget {
//   final File? file;
//   final String? url;
//   final double width;
//   final double height;
//   final double borderRadius;
//
//   const VideoThumbnailWidget({
//     Key? key,
//     this.file,
//     this.url,
//     required this.width,
//     required this.height,
//     this.borderRadius = 8,
//   }) : super(key: key);
//
//   @override
//   _VideoThumbnailWidgetState createState() => _VideoThumbnailWidgetState();
// }
//
// class _VideoThumbnailWidgetState extends State<VideoThumbnailWidget>
//     with AutomaticKeepAliveClientMixin {
//   Future<ThumbnailResult>? _thumbnailFuture;
//
//   @override
//   bool get wantKeepAlive => true;
//
//   @override
//   void initState() {
//     super.initState();
//     _thumbnailFuture = VideoThumbnailCache.getThumbnail(
//         widget.file, widget.url, widget.width, widget.height);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return FutureBuilder<ThumbnailResult>(
//       future: _thumbnailFuture,
//       builder: (context, AsyncSnapshot<ThumbnailResult> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Container(
//             width: widget.width,
//             height: widget.height,
//             color: AppColors.gray200,
//             child: AppImage(
//               assetUrl: 'assets/images/video_thumbnail.png',
//               fit: BoxFit.cover,
//               width: widget.width,
//               height: widget.height,
//             ),
//           );
//         } else if (snapshot.hasData) {
//           final image = snapshot.data!.image;
//           return ClipRRect(
//             borderRadius: BorderRadius.circular(widget.borderRadius),
//             child: Stack(
//               children: <Widget>[
//                 image,
//                 const Positioned.fill(
//                   left: 0,
//                   child: Icon(
//                     Icons.play_circle_filled,
//                     size: 40,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         } else {
//           return AppImage(
//             assetUrl: 'assets/images/video_thumbnail.png',
//             fit: BoxFit.cover,
//             width: widget.width,
//             height: widget.height,
//           );
//         }
//       },
//     );
//   }
// }
