// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Application _$ApplicationFromJson(Map<String, dynamic> json) {
  return Application(
    json['id'],
    json['cliente'],
    json['name'],
    json['version'],
    json['patch'],
    json['token'],
  );
}

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cliente': instance.cliente,
      'name': instance.name,
      'version': instance.version,
      'patch': instance.patch,
      'token': instance.token,
    };
