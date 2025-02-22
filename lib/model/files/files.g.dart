// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FilesImpl _$$FilesImplFromJson(Map<String, dynamic> json) => _$FilesImpl(
      name: json['name'] as String?,
      url: json['url'] as String?,
      size: (json['size'] as num?)?.toInt(),
      mimeType: json['mime_type'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
      createdAt: (json['created_at'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FilesImplToJson(_$FilesImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'size': instance.size,
      'mime_type': instance.mimeType,
      'thumbnail_url': instance.thumbnailUrl,
      'created_at': instance.createdAt,
    };
