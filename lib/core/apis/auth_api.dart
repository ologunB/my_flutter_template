import 'base_api.dart';

class AuthApi extends BaseAPI {
  Future<LoginResponse> signup(Map<String, dynamic> data) async {
    String url = 'users/v1/auth/register';
    log(data);
    try {
      final Response res = await dio().post(url, data: data);
      log(res.data);
      switch (res.statusCode) {
        case 201:
          return LoginResponse.fromJson(res.data['data']);
        default:
          throw error(res.data);
      }
    } catch (e) {
      log(e);
      throw BlumeException(DioErrorUtil.handleError(e));
    }
  }

  Future<KycModel> getKyc() async {
    String url = 'users/v1/kyc/${AppCache.getUser()?.user?.id}';
    try {
      final Response res = await dio().get(url);
      log(res.data);
      switch (res.statusCode) {
        case 200:
          return KycModel.fromJson(res.data['data']['kyc']);
        default:
          throw error(res.data);
      }
    } catch (e) {
      log(e);
      throw BlumeException(DioErrorUtil.handleError(e));
    }
  }
}
