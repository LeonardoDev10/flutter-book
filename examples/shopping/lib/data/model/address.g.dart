// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
    id: json['id'] as int,
    name: json['name'] as String,
    code: json['code'] as String,
  );
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
    };

Zone _$ZoneFromJson(Map<String, dynamic> json) {
  return Zone(
    id: json['id'] as int,
    country: json['country'] == null
        ? null
        : Country.fromJson(json['country'] as Map<String, dynamic>),
    name: json['name'] as String,
    code: json['code'] as String,
  );
}

Map<String, dynamic> _$ZoneToJson(Zone instance) => <String, dynamic>{
      'id': instance.id,
      'country': instance.country,
      'name': instance.name,
      'code': instance.code,
    };

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    id: json['id'] as int,
    zone: json['zone'] == null
        ? null
        : Zone.fromJson(json['zone'] as Map<String, dynamic>),
    name: json['name'] as String,
    zipcode: json['zipcode'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'zone': instance.zone,
      'name': instance.name,
      'zipcode': instance.zipcode,
    };
