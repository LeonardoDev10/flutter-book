// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) {
  return Group(
    id: json['id'] as int,
    application: json['application'] == null
        ? null
        : Application.fromJson(json['application'] as Map<String, dynamic>),
    name: json['name'] as String,
    slug: json['slug'] as String,
  );
}

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'id': instance.id,
      'application': instance.application,
      'name': instance.name,
      'slug': instance.slug,
    };

Permission _$PermissionFromJson(Map<String, dynamic> json) {
  return Permission(
    id: json['id'] as int,
    group: json['group'] == null
        ? null
        : Group.fromJson(json['group'] as Map<String, dynamic>),
    name: json['name'] as String,
    slug: json['slug'] as String,
  );
}

Map<String, dynamic> _$PermissionToJson(Permission instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group': instance.group,
      'name': instance.name,
      'slug': instance.slug,
    };
