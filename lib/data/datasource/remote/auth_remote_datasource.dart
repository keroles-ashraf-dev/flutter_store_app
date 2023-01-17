import 'package:store/data/model/login_request_model.dart';
import 'package:store/data/model/register_request_model.dart';

import '../../model/user_model.dart';
import '../../network/api_constant.dart';
import '../../network/api_manager.dart';

abstract class BaseAuthRemoteDatasource {
  Future<UserModel> login(LoginRequestModel loginRequestModel);

  Future<UserModel> register(RegisterRequestModel registerRequestModel);
}

class AuthRemoteDatasourceImpl implements BaseAuthRemoteDatasource {
  final ApiManager _apiManager;

  AuthRemoteDatasourceImpl(this._apiManager);

  /// login
  @override
  Future<UserModel> login(LoginRequestModel loginRequestModel) async {
    try {
      final res = await _apiManager().post(
        ApiConstant.loginUri,
        loginRequestModel.toJson(),
        sendAuth: false,
      );

      final jsonData = res.data[ApiConstant.resDataKey];
      final userData = jsonData[ApiConstant.resDataUserKey];

      return UserModel.fromJson(userData);
    } catch (e) {
      rethrow;
    }
  }

  /// register
  @override
  Future<UserModel> register(RegisterRequestModel registerRequestModel) async {
    try {
      final res = await _apiManager().post(
        ApiConstant.registerUri,
        registerRequestModel.toJson(),
        sendAuth: false,
      );

      final jsonData = res.data[ApiConstant.resDataKey];
      final userData = jsonData[ApiConstant.resDataUserKey];

      return UserModel.fromJson(userData);
    } catch (e) {
      rethrow;
    }
  }
}
