// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingCenter _$ShoppingCenterFromJson(Map<String, dynamic> json) {
  return ShoppingCenter(
    id: json['id'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$ShoppingCenterToJson(ShoppingCenter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Shop _$ShopFromJson(Map<String, dynamic> json) {
  return Shop(
    id: json['id'] as int,
    shoppingCenter: json['shoppingCenter'] == null
        ? null
        : ShoppingCenter.fromJson(
            json['shoppingCenter'] as Map<String, dynamic>),
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'id': instance.id,
      'shoppingCenter': instance.shoppingCenter,
      'name': instance.name,
    };
