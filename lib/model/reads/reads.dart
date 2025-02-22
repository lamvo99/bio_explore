// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reads.g.dart';
part 'reads.freezed.dart';

@freezed
class Reads with _$Reads {
  const factory Reads({
    @JsonKey(name: "conversation_id") String? conversationId,
    @JsonKey(name: "message_id") int? messageId,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "created_at") int? createdAt,
  }) = _Reads;

  static Reads get empty => const Reads();

  factory Reads.fromJson(Map<String, dynamic> json) =>
      _$ReadsFromJson(json);
}
