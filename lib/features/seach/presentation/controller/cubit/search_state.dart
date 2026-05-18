part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchsuccedState extends SearchState {}

class SearchFailureState extends SearchState {}
