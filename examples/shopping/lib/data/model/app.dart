import 'package:json_annotation/json_annotation.dart';

part 'app.g.dart';

@JsonSerializable()
class Application {
  final int id = 1;
  final String cliente = '@felipebastosweb';
  final String name = 'feiralivreapp';
  final String version = '0.0.1';
  final String patch = 'alpha-001';
  final String token = '';

  Application(id, cliente, name, version, patch, token);
  factory Application.fromJson(Map<String, dynamic> json) => _$ApplicationFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationToJson(this);
}

