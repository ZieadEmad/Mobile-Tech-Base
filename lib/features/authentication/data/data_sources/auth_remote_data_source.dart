import 'package:arch/core/data/models/base_response/response_model.dart';
import 'package:arch/features/authentication/domain/use_cases/sign_in_use_case.dart';

abstract interface class AuthRemoteDataSource {
  Future<ResponseModel> signIn(SignInParams params);
}
