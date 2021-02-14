import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Country {
  final int id;
  final String name;
  final String code;

  Country({this.id, this.name, this.code});
  factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);
  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable()
class Zone {
  final int id;
  final Country country;
  final String name;
  final String code;

  Zone({this.id, this.country, this.name, this.code});
  factory Zone.fromJson(Map<String, dynamic> json) => _$ZoneFromJson(json);
  Map<String, dynamic> toJson() => _$ZoneToJson(this);
}

@JsonSerializable()
class Address {
  final int id;
  final Zone zone;
  final String name;
  final String zipcode;

  Address({this.id, this.zone, this.name, this.zipcode});
  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

