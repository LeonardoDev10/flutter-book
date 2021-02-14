import 'package:money2/money2.dart';
import 'package:feiralivre/data/model/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class CartItem {
  final int id;
  final ProductShop productShop;
  final double amount;
  final int total;
  final String currency;
  final int decimalPlaces;

  CartItem({this.id, this.productShop, this.amount, this.total, this.currency, this.decimalPlaces});

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);
  Map<String, dynamic> toJson() => _$CartItemToJson(this);

  Money convertTotalInMoney() {
    final Currency currency = Currency.create(this.currency, this.decimalPlaces);
    Money total = Money.fromInt(this.total, currency);
    return total;
  }
}
