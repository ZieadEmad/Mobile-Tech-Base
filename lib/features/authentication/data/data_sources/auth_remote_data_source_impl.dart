import '../../../../core/constans/remote_urls.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';
import '../../../../core/network/dio_service.dart';
import '../../../global/response_model.dart';
import '../../domain/use_cases/sign_in_use_case.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final NetworkService _networkService;

  AuthRemoteDataSourceImpl(this._networkService);

  @override
  Future<ResponseModel> signIn(SignInParams params) async {
    try {
      final response = await _networkService.request(
        RemoteURLs.loginPath,
        httpMethod: HttpMethod.post,
        data: {"username": params.codeOrEmail, "password": params.password},
      );
      final responseModel = ResponseModel.fromJson(response.data);
      return responseModel;
    } catch (e) {
      throw ConnectionFailure(ExceptionType.normal, e.toString());
    }
  }
}
