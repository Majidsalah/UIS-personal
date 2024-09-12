part of 'user_details_cubit.dart';

sealed class UserDetailsState extends Equatable {
  const UserDetailsState();

  @override
  List<Object> get props => [];
}

final class UserDetailsInitial extends UserDetailsState {}

final class UserDetailsLoading extends UserDetailsState {}

final class UserDetailsSucess extends UserDetailsState {
  final UserDetailsModel user;

  const UserDetailsSucess({required this.user});
}

final class UserDetailsFailure extends UserDetailsState {}
