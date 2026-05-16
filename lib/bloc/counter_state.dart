part of 'counter_bloc.dart';

abstract class CounterState {
  final int id;

  const CounterState(this.id);
}

class CounterInitialState extends CounterState {
  const CounterInitialState() : super(10);
}

class CounterUpdateState extends CounterState {
  const CounterUpdateState(int id) : super(id);
}
