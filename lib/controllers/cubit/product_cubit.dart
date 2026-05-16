import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:state_management_learn/constants/api_constants.dart';
import 'package:state_management_learn/models/product_model.dart';
import 'package:http/http.dart' as http;
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitialState());

  Future<void> getProductsList() async {
    emit(ProductLoadingState());
    await Future.delayed(Duration(seconds: 4));
    try {
      final Uri url =
          Uri.parse('${ApiConstants.baseUrl + ApiConstants.productsEndpoint}');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        final products = data.map((e) => ProductModel.fromJson(e)).toList();

        emit(ProductSuccesState(products));
      }
    } catch (error) {
      print("exeption -> $error");
      emit(ProductFailureState("exeption -> $error"));
    }
  }
}
