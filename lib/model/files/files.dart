// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'files.g.dart';

part 'files.freezed.dart';

@freezed
class Files with _$Files {
  const factory Files({
    String? name,
    String? url,
    int? size,
    @JsonKey(name: "mime_type") String? mimeType,
    @JsonKey(name: "thumbnail_url") String? thumbnailUrl,
    @JsonKey(name: "created_at") int? createdAt,
  }) = _Files;

  static Files get empty => const Files();

  factory Files.fromJson(Map<String, dynamic> json) => _$FilesFromJson(json);
}
