import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(const CardInitialState()) {
    on<ShowDetailsCardEvent>((event, emit) {
      emit(state.copyWith(isShowDetails: event.isShowDetails));
    });
  }
}
