// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reads.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReadsImpl _$$ReadsImplFromJson(Map<String, dynamic> json) => _$ReadsImpl(
      conversationId: json['conversation_id'] as String?,
      messageId: (json['message_id'] as num?)?.toInt(),
      userId: json['user_id'] as String?,
      createdAt: (json['created_at'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ReadsImplToJson(_$ReadsImpl instance) =>
    <String, dynamic>{
      'conversation_id': instance.conversationId,
      'message_id': instance.messageId,
      'user_id': instance.userId,
      'created_at': instance.createdAt,
    };
