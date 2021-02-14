import 'package:json_annotation/json_annotation.dart';
import 'package:feiralivre/data/model/app.dart';

part 'permission.g.dart';

@JsonSerializable()
class Group {
  final int id;
  final Application application;
  final String name;
  final String slug;

  Group({this.id, this.application, this.name, this.slug});
  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
  Map<String, dynamic> toJson() => _$GroupToJson(this);
}

@JsonSerializable()
class Permission {
  final int id;
  final Group group;
  final String name;
  final String slug;

  Permission({this.id, this.group, this.name, this.slug});
  factory Permission.fromJson(Map<String, dynamic> json) => _$PermissionFromJson(json);
  Map<String, dynamic> toJson() => _$PermissionToJson(this);

}