import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String username;
  final String email;
  final String password;
  final String? role;
  final Profile? profile;

  const User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    this.role,
    this.profile,
  });

  @override
  List<Object?> get props => [id, username, email, password, role, profile];
}

class Profile extends Equatable {
  final int id;
  final String? firstName;
  final String? lastName;
  final DateTime? dateOfBirth;

  const Profile({
    required this.id,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
  });

  @override
  List<Object?> get props => [id, firstName, lastName, dateOfBirth];
}
