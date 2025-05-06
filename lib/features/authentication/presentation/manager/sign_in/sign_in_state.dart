part of 'sign_in_cubit.dart';

sealed class SignInState extends Equatable{}

final class SignInInitial extends SignInState {
  @override
  List<Object> get props => [];
}

final class SignInLoading extends SignInState {
  @override
  List<Object> get props => [];
}

final class SignInFormValid extends SignInState {
  @override
  List<Object> get props => [];
}

final class SignInFormInValid extends SignInState {
  @override
  List<Object> get props => [];
}

final class SignInSuccess extends SignInState {
  @override
  List<Object> get props => [];


}

final class SignInFailed extends SignInState {
  final String errorMessage;
  SignInFailed(this.errorMessage);
  @override
  // if we have data we need to pass it
  List<Object> get props => [errorMessage];
}
