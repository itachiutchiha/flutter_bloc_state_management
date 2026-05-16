import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitialState()) {
    print("Cubit is created\n");
  }

  void incrementCounter() {
    print("old state -> ${state.number}\n");
    emit(CounterUpdateState(state.number + 1));
    print("new state -> ${state.number}\n");
  }

  void decrementCounter() {
    print("old state -> ${state.number}\n");
    emit(CounterUpdateState(state.number - 1));
    print("new state -> ${state.number}\n");
  }
}
