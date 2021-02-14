import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:feiralivre/data/model/product.dart';

const String urlAPI = 'https://feiralivre.herokuapp.com/';
const String userTokenAPI = '';

/// parse products in list
List<Product> parseProducts(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Product>((json) => Product.fromJson(json)).toList();
}

/// fetch product list
Future<List<Product>> fetchProducts(http.Client client) async {
  final response = await client.get('$urlAPI/products');
  return compute(parseProducts, response.body);
}

/// fetch a product
Future<Product> fetchProduct(String id) async {
  final response = await http.get('$urlAPI/product/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: userTokenAPI
      });
  if (response.statusCode == 200) {
    return Product.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

/// insert a product
Future<Product> createProduct(Product product) async {
  final response = await http.post('$urlAPI/product/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: userTokenAPI
      },
      body: jsonEncode(product));
  if (response.statusCode == 201) {
    return Product.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create product.');
  }
}

/// update a product
Future<Product> updateProduct(Product product) async {
  final http.Response response = await http.put('$urlAPI/product/${product.id}',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: userTokenAPI
    },
    body: jsonEncode(product),
  );
  if (response.statusCode == 200) {
    return Product.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load product');
  }
}

/// delete a product
Future<Product> deleteProduct(String id) async {
  final http.Response response = await http.delete('$urlAPI/product/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: userTokenAPI
      });
  if (response.statusCode == 200) {
    return Product.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to delete product.');
  }
}
