// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return CartItem(
    id: json['id'] as int,
    productShop: json['productShop'] == null
        ? null
        : ProductShop.fromJson(json['productShop'] as Map<String, dynamic>),
    amount: (json['amount'] as num)?.toDouble(),
    total: json['total'] as int,
    currency: json['currency'] as String,
    decimalPlaces: json['decimalPlaces'] as int,
  );
}

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'id': instance.id,
      'productShop': instance.productShop,
      'amount': instance.amount,
      'total': instance.total,
      'currency': instance.currency,
      'decimalPlaces': instance.decimalPlaces,
    };
