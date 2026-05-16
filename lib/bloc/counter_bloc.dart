import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

// class CounterBloc extends Bloc<CounterEvent, CounterState> {
//   CounterBloc() : super(CounterInitialState()) {
//     on<CounterEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitialState()) {
    on<IncrementEvent>(increment);

    on<DecrementEvent>((event, emit) => {emit(CounterUpdateState(5))});
  }

  FutureOr<void> increment(event, emit) => emit(CounterUpdateState(5));
}
