part of 'new_pin_cubit.dart';

sealed class NewPinState extends Equatable {
  const NewPinState();

  @override
  List<Object> get props => [];
}

final class NewPinInitial extends NewPinState {}
final class NewPinLoading extends NewPinState {}
final class NewPinSuccess extends NewPinState {}
final class NewPinFailure extends NewPinState {}
