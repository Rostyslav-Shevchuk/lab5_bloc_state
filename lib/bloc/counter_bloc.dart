import 'package:flutter_bloc/flutter_bloc.dart';

// Події для лічильника
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

// Стани для лічильника
class CounterState {
  final int counterValue;

  CounterState(this.counterValue);
}

// Реалізація BLoC для лічильника
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    // Обробка події збільшення
    on<IncrementEvent>((event, emit) {
      emit(CounterState(state.counterValue + 1));
    });

    // Обробка події зменшення
    on<DecrementEvent>((event, emit) {
      if (state.counterValue > 0) {
        emit(CounterState(state.counterValue - 1));
      }
    });
  }
}
