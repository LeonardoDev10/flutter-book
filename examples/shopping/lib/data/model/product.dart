import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final int id;
  final String model;
  final String name;

  Product({this.id, this.model, this.name});
  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class ProductShop {
  final int id;
  final Product product;
  /// https://pub.dev/packages/money2
  final int price;
  final int decimalPlaces;
  final String currency;

  ProductShop({this.id, this.product, this.price, this.decimalPlaces, this.currency});
  factory ProductShop.fromJson(Map<String, dynamic> json) => _$ProductShopFromJson(json);
  Map<String, dynamic> toJson() => _$ProductShopToJson(this);
}

@JsonSerializable()
class ProductDescription {
  final int id;
  final ProductShop productShop;
  final String description;

  ProductDescription({this.id, this.productShop, this.description});
  factory ProductDescription.fromJson(Map<String, dynamic> json) => _$ProductDescriptionFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDescriptionToJson(this);
}

@JsonSerializable()
class ProductImage {
  final int id;
  final ProductShop productShop;
  final String image;

  ProductImage({this.id, this.productShop, this.image});
  factory ProductImage.fromJson(Map<String, dynamic> json) => _$ProductImageFromJson(json);
  Map<String, dynamic> toJson() => _$ProductImageToJson(this);
}