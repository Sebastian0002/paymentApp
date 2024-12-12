part of 'card_bloc.dart';

@immutable
sealed class CardState extends Equatable {
  const CardState({this.isShowDetails = false});
  final bool isShowDetails;

  CardInitialState copyWith({
    bool? isShowDetails
  })=>
    CardInitialState( 
      isShowDetails: isShowDetails ?? this.isShowDetails);

  @override
  List<Object?> get props => [isShowDetails];
}

final class CardInitialState extends CardState {
  const CardInitialState({super.isShowDetails});
}
