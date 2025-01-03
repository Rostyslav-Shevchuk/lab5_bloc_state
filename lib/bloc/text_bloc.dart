import 'package:flutter_bloc/flutter_bloc.dart';

// Події для тексту
abstract class TextEvent {}

class UpdateTextEvent extends TextEvent {
  final String newText;

  UpdateTextEvent(this.newText);
}

// Стани для тексту
class TextState {
  final String textValue;

  TextState(this.textValue);
}

// BLoC для тексту
class TextBloc extends Bloc<TextEvent, TextState> {
  TextBloc() : super(TextState('')) {
    on<UpdateTextEvent>((event, emit) {
      emit(TextState(event.newText));
    });
  }
}

