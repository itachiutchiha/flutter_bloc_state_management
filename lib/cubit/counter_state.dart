part of 'counter_cubit.dart';

abstract class CounterState {
  final int number;

  CounterState(this.number);
}

class CounterInitialState extends CounterState {
  CounterInitialState() : super(0);
}

class CounterUpdateState extends CounterState {
  CounterUpdateState(int number) : super(number);
}
