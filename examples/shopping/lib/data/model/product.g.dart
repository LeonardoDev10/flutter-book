// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] as int,
    model: json['model'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'model': instance.model,
      'name': instance.name,
    };

ProductShop _$ProductShopFromJson(Map<String, dynamic> json) {
  return ProductShop(
    id: json['id'] as int,
    product: json['product'] == null
        ? null
        : Product.fromJson(json['product'] as Map<String, dynamic>),
    price: json['price'] as int,
    decimalPlaces: json['decimalPlaces'] as int,
    currency: json['currency'] as String,
  );
}

Map<String, dynamic> _$ProductShopToJson(ProductShop instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'price': instance.price,
      'decimalPlaces': instance.decimalPlaces,
      'currency': instance.currency,
    };

ProductDescription _$ProductDescriptionFromJson(Map<String, dynamic> json) {
  return ProductDescription(
    id: json['id'] as int,
    productShop: json['productShop'] == null
        ? null
        : ProductShop.fromJson(json['productShop'] as Map<String, dynamic>),
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$ProductDescriptionToJson(ProductDescription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productShop': instance.productShop,
      'description': instance.description,
    };

ProductImage _$ProductImageFromJson(Map<String, dynamic> json) {
  return ProductImage(
    id: json['id'] as int,
    productShop: json['productShop'] == null
        ? null
        : ProductShop.fromJson(json['productShop'] as Map<String, dynamic>),
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$ProductImageToJson(ProductImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productShop': instance.productShop,
      'image': instance.image,
    };
