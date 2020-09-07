import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_library/counter_bloc.dart';
import 'package:flutter_bloc_library/counter_observer.dart';
import 'package:flutter_bloc_library/counter_state.dart';

import 'counter_event.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Pattern Demo',
      theme: ThemeData(
        primaryColor: Colors.grey[900],
        accentColor: Colors.grey[700],
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (_) => CounterBloc(),
        child: CounterPage(title: 'Flutter Demo Home Page'),
        ),
      //home: CounterPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class CounterPage extends StatefulWidget {
  CounterPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (_, counterState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                SizedBox(height: 20.0,),
                Text(
                  '${counterState.counter}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            key: Key('increment'),
            onPressed: () =>
                context.bloc<CounterBloc>().add(CounterEvent.increment),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            key: Key('decrement'),
            onPressed: () =>
                context.bloc<CounterBloc>().add(CounterEvent.decrement),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  /*
  final counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          cubit: counterBloc,
          builder: (_, counterState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '${counterState.counter}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => counterBloc.add(CounterEvent.increment),
            //context.bloc<CounterBloc>().add(CounterEvent.increment),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            onPressed: () => counterBloc.add(CounterEvent.decrement),
            //context.bloc<CounterBloc>().add(CounterEvent.decrement),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }*/
}
