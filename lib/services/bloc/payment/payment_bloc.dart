import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:payment_app/domain/model/credit_card.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(const PaymentInitialState()) {
    on<OnSelectedCard>((event, emit) {
      emit(state.copyWith(isSelectedCard: true, selectedCard: event.card));
    });
    
    on<OnUnselectedCard>((event, emit) {
      emit(state.copyWith(isSelectedCard: false));
    });
    
    on<SwitchShowDetailsCardEvent>((event, emit) {
      emit(state.copyWith(isShowDetails: !state.isShowDetails));
    });
  }
  
}
