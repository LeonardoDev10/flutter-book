// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    username: json['username'] as String,
    email: json['email'] as String,
    celular: json['celular'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'celular': instance.celular,
    };

UserSecret _$UserSecretFromJson(Map<String, dynamic> json) {
  return UserSecret(
    id: json['id'] as int,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$UserSecretToJson(UserSecret instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'password': instance.password,
    };

UserGroup _$UserGroupFromJson(Map<String, dynamic> json) {
  return UserGroup(
    id: json['id'] as int,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    group: json['group'] == null
        ? null
        : Group.fromJson(json['group'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserGroupToJson(UserGroup instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'group': instance.group,
    };

UserAccess _$UserAccessFromJson(Map<String, dynamic> json) {
  return UserAccess(
    id: json['id'] as int,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$UserAccessToJson(UserAccess instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'token': instance.token,
    };
