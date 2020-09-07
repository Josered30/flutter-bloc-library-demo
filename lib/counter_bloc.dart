import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_library/counter_event.dart';
import 'package:flutter_bloc_library/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial());

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield CounterState(counter: state.counter + 1);
        break;
      case CounterEvent.decrement:
        yield CounterState(counter: state.counter - 1);
        break;
      default:
        addError(Exception('unsupported event'));
    }
  }
}