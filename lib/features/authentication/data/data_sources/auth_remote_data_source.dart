import '../../../global/response_model.dart';
import '../../domain/use_cases/sign_in_use_case.dart';

abstract interface class AuthRemoteDataSource {
  Future<ResponseModel> signIn(SignInParams params);
}
