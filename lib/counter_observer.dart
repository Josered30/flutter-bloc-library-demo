import 'package:flutter_bloc/flutter_bloc.dart';

class CounterObserver extends BlocObserver {

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('${bloc.runtimeType} $transition');
    super.onTransition(bloc, transition);
  }
}
