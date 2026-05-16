part of 'product_cubit.dart';

abstract class ProductState extends Equatable {}

class ProductInitialState extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductSuccesState extends ProductState {
  final List<ProductModel> products;

  ProductSuccesState(this.products);

  @override
  // TODO: implement props
  List<Object?> get props => [products];
}

class ProductLoadingState extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductFailureState extends ProductState {
  final String error;

  ProductFailureState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
