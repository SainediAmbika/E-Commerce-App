import 'dart:convert';

import 'package:flutter/foundation.dart';

class Eachproduct {
  int id;
  String title;
  String description;
  int price;
  double discountPercentage;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;

  Eachproduct({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  Eachproduct copyWith({
    int? id,
    String? title,
    String? description,
    int? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    String? brand,
    String? category,
    String? thumbnail,
    List<String>? images,
  }) {
    return Eachproduct(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      rating: rating ?? this.rating,
      stock: stock ?? this.stock,
      brand: brand ?? this.brand,
      category: category ?? this.category,
      thumbnail: thumbnail ?? this.thumbnail,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'brand': brand,
      'category': category,
      'thumbnail': thumbnail,
      'images': images,
    };
  }

  factory Eachproduct.fromMap(Map<String, dynamic> map) {
    return Eachproduct(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      price: map['price'],
      discountPercentage: map['discountPercentage'],
      rating: map['rating'],
      stock: map['stock'],
      brand: map['brand'],
      category: map['category'],
      thumbnail: map['thumbnail'],
      images: List<String>.from(map['images']),
    );
  }
  String toJson() => json.encode(toMap());
  factory Eachproduct.fromJson(String source) => Eachproduct.fromMap(json.decode(source));
  @override
  String toString() {
    return 'Eachproduct(id: $id, title: $title, description: $description, price: $price, discountPercentage: $discountPercentage, rating: $rating, stock: $stock, brand: $brand, category: $category, thumbnail: $thumbnail, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Eachproduct &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.price == price &&
        other.discountPercentage == discountPercentage &&
        other.rating == rating &&
        other.stock == stock &&
        other.brand == brand &&
        other.category == category &&
        other.thumbnail == thumbnail &&
        listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        price.hashCode ^
        discountPercentage.hashCode ^
        rating.hashCode ^
        stock.hashCode ^
        brand.hashCode ^
        category.hashCode ^
        thumbnail.hashCode ^
        images.hashCode;
  }
}

class ProductsModel {
  List<Eachproduct>? products = [];
  int? total;
  int? skip;
  int? limit;
  ProductsModel({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });
  ProductsModel copyWith({
    List<Eachproduct>? products,
    int? total,
    int? skip,
    int? limit,
  }) {
    return ProductsModel(
      products: products ?? this.products,
      total: total ?? this.total,
      skip: skip ?? this.skip,
      limit: limit ?? this.limit,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'products': products?.map((x) => x?.toMap())?.toList(),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      products: List<Eachproduct>.from(map['products']?.map((x) => Eachproduct.fromMap(x))),
      total: map['total'],
      skip: map['skip'],
      limit: map['limit'],
    );
  }
  String toJson() => json.encode(toMap());
  factory ProductsModel.fromJson(String source) => ProductsModel.fromMap(json.decode(source));
  @override
  String toString() {
    return 'ProductsModel(products: $products, total: $total, skip: $skip, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductsModel &&
        listEquals(other.products, products) &&
        other.total == total &&
        other.skip == skip &&
        other.limit == limit;
  }

  @override
  int get hashCode {
    return products.hashCode ^ total.hashCode ^ skip.hashCode ^ limit.hashCode;
  }
}
