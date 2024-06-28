import 'base_api.dart';

class RestaurantsApi extends BaseAPI {
  Future<List<UserModel>> getVCards() async {
    String url = 'cards/v1?type=VIRTUAL';
    try {
      final Response res = await dio().get(url);
      log(res.data);
      switch (res.statusCode) {
        case 200:
          List<UserModel> all = [];
          for (dynamic d in res.data['data']['cards']) {
            all.add(UserModel.fromJson(d));
          }
          return all;
        default:
          throw error(res.data);
      }
    } catch (e) {
      log(e);
      throw BlumeException(DioErrorUtil.handleError(e));
    }
  }
}
