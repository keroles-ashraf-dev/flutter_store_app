import '../../model/user_model.dart';
import '../../network/api_constant.dart';
import '../../network/api_manager.dart';

abstract class BaseUserRemoteDatasource {
  Future<UserModel> getUserData();
}

class UserRemoteDatasourceImpl implements BaseUserRemoteDatasource {
  final ApiManager _apiManager;

  UserRemoteDatasourceImpl(this._apiManager);

  @override
  Future<UserModel> getUserData() async {
    try {
      final res = await _apiManager().get(ApiConstant.userDataUri);

      final jsonData = res.data[ApiConstant.resDataKey];
      final userData = jsonData[ApiConstant.resDataUserKey];

      return UserModel.fromJson(userData);
    } catch (e) {
      rethrow;
    }
  }
}
