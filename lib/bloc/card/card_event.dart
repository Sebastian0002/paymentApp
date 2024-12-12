part of 'card_bloc.dart';

@immutable
sealed class CardEvent {}


class ShowDetailsCardEvent extends CardEvent{
  
  final bool isShowDetails;
  ShowDetailsCardEvent({required this.isShowDetails});

}