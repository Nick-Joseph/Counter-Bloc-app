import 'package:counter_bloc_app/bloc/counter_bloc.dart';
import 'package:counter_bloc_app/bloc/counter_event.dart';
import 'package:counter_bloc_app/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CounterBloc(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<CounterBloc, CounterStates>(builder: (context, state) {
        if (state is InitialState) {
          return _counter(context, 0);
        }
        if (state is UpdateState) {
          return _counter(context, state.counter);
        }
        return Container();
      }),
    );
  }

  Widget _counter(BuildContext context, int counter) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            counter.toString(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.red,
                elevation: 0,
                height: 50,
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () =>
                    context.read<CounterBloc>().add(NumberDecrease()),
              ),
              const SizedBox(
                width: 10,
              ),
              MaterialButton(
                color: Colors.green,
                elevation: 0,
                height: 50,
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () =>
                    context.read<CounterBloc>().add(NumberIncrease()),
              ),
            ],
          )
        ],
      ),
    );
  }
}
