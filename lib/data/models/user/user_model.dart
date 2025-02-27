import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String username,
    required String email,
    required String password,
    String? role,
    ProfileModel? profile,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required int id,
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}

extension UserModelX on UserModel {
  User toEntity() {
    return User(
      id: id,
      username: username,
      email: email,
      password: password,
      role: role,
      profile: profile?.toEntity(),
    );
  }
}

extension ProfileModelX on ProfileModel {
  Profile toEntity() {
    return Profile(
      id: id,
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: dateOfBirth,
    );
  }
}
