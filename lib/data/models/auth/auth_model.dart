import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/auth.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
class AuthModel with _$AuthModel {
  const factory AuthModel({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'access_token') required String accessToken,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
}

extension AuthModelX on AuthModel {
  Auth toEntity() {
    return Auth(accessToken: accessToken);
  }
}
