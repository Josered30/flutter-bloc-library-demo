class CounterState {
  final int counter;

  const CounterState({this.counter});

  factory CounterState.initial() {
    return CounterState(counter: 0);
  }
}
