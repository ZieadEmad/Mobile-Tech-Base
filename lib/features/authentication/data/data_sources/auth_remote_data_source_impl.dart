import 'package:arch/core/data/models/base_response/response_model.dart';
import 'package:arch/core/data/network/dio_services.dart';
import 'package:arch/core/data/network/utill/remote_urls.dart';
import 'package:arch/core/domain/entities/enum/server_error_code.dart';
import 'package:arch/core/domain/entities/failure.dart';
import 'package:arch/features/authentication/domain/use_cases/sign_in_use_case.dart';

import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final NetworkService _networkService;

  AuthRemoteDataSourceImpl(this._networkService);

  @override
  Future<ResponseModel> signIn(SignInParams params) async {
    try {
      final response = await _networkService.request(
        RemoteURLs.loginPath,
        httpMethod: HttpMethod.patch,
        data: {"username": params.codeOrEmail, "password": params.password},
      );
      final responseModel = ResponseModel.fromJson(response.data);
      return responseModel;
    } catch (e) {
      throw ServerFailure(
        errorCode: ServerErrorCode.serverError,
        message: e.toString(),
      );
    }
  }
}
