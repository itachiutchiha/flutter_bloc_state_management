// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:state_management_learn/constants/api_constants.dart';

class RatingModel extends Equatable {
  final num rate;
  final int count;

  const RatingModel(this.rate, this.count);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ApiKeys.rate: rate,
      ApiKeys.count: count,
    };
  }

  factory RatingModel.fromJson(Map<String, dynamic> map) {
    return RatingModel(
      map[ApiKeys.rate] as num,
      map[ApiKeys.count] as int,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [rate, count];
}
