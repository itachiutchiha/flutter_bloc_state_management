import 'package:bloc/bloc.dart';
import 'package:state_management_learn/features/character/data/models/character_model.dart';
import 'package:state_management_learn/features/character/presentation/controller/cubit/character_cubit.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  CharacterState charactereState;

  SearchCubit(this.charactereState) : super(SearchInitial());
}
