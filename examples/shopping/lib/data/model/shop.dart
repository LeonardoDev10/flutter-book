import 'package:json_annotation/json_annotation.dart';

part 'shop.g.dart';

@JsonSerializable()
class ShoppingCenter {
  final int id;
  final String name;

  ShoppingCenter({this.id, this.name});
  factory ShoppingCenter.fromJson(Map<String, dynamic> json) => _$ShoppingCenterFromJson(json);
  Map<String, dynamic> toJson() => _$ShoppingCenterToJson(this);
}

@JsonSerializable()
class Shop {
  final int id;
  final ShoppingCenter shoppingCenter;
  final String name;

  Shop({this.id, this.shoppingCenter, this.name});
  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);
  Map<String, dynamic> toJson() => _$ShopToJson(this);
}
