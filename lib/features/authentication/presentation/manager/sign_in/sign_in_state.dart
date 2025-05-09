part of 'sign_in_cubit.dart';

sealed class SignInState extends Equatable {}

final class SignInInitial extends SignInState {
  @override
  List<Object> get props => [];
}

final class SignInLoading extends SignInState {
  @override
  List<Object> get props => [];
}

final class SignInSuccess extends SignInState {
  dynamic data;

  SignInSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class SignInFailed extends SignInState {
  final Failure failure;

  SignInFailed(this.failure);

  @override
  // if we have data we need to pass it
  List<Object> get props => [failure];
}
