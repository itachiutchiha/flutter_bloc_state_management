// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:state_management_learn/constants/api_constants.dart';

import 'package:state_management_learn/models/rating_model.dart';

class ProductModel extends Equatable {
  final int id;
  final String title;
  final num price;
  final String descreption;
  final String category;
  final String imageUrl;
  final RatingModel rating;

  const ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.descreption,
      required this.category,
      required this.imageUrl,
      required this.rating});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ApiKeys.id: id,
      ApiKeys.title: title,
      ApiKeys.price: price,
      ApiKeys.descreption: descreption,
      ApiKeys.category: category,
      ApiKeys.image: imageUrl,
      ApiKeys.rating: rating.toJson(),
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      id: map[ApiKeys.id] as int,
      title: map[ApiKeys.title] as String,
      price: map[ApiKeys.price] as num,
      descreption: map[ApiKeys.descreption] as String,
      category: map[ApiKeys.category] as String,
      imageUrl: map[ApiKeys.image] as String,
      rating: RatingModel.fromJson(map[ApiKeys.rating] as Map<String, dynamic>),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, title, price, descreption, category, imageUrl];
}
