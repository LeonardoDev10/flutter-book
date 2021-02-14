import 'package:json_annotation/json_annotation.dart';
import 'package:feiralivre/data/model/permission.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String username;
  final String email;
  final String celular;

  User({this.id, this.username, this.email, this.celular});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class UserSecret {
  final int id;
  final User user;
  final String password;

  UserSecret({this.id, this.user, this.password});
  factory UserSecret.fromJson(Map<String, dynamic> json) => _$UserSecretFromJson(json);
  Map<String, dynamic> toJson() => _$UserSecretToJson(this);
}

@JsonSerializable()
class UserGroup {
  final int id;
  final User user;
  final Group group;

  UserGroup({this.id, this.user, this.group});
  factory UserGroup.fromJson(Map<String, dynamic> json) => _$UserGroupFromJson(json);
  Map<String, dynamic> toJson() => _$UserGroupToJson(this);
}

@JsonSerializable()
class UserAccess {
  final int id;
  final User user;
  final String token;

  UserAccess({this.id, this.user, this.token});
  factory UserAccess.fromJson(Map<String, dynamic> json) => _$UserAccessFromJson(json);
  Map<String, dynamic> toJson() => _$UserAccessToJson(this);
}
