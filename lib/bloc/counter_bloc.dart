import 'package:counter_bloc_app/bloc/counter_event.dart';
import 'package:counter_bloc_app/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  CounterBloc() : super(InitialState()) {}
}
