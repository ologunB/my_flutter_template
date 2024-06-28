import 'package:spur/core/apis/restaurants_api.dart';

import 'base_vm.dart';

class RestaurantsViewModel extends BaseModel {
  final RestaurantsApi _api = locator<RestaurantsApi>();
  String? error;

  List<UserModel>? vCards;
  Future<void> getVCards() async {
    setBusy(true);
    try {
      vCards = await _api.getVCards();

      setBusy(false);
    } on BlumeException catch (e) {
      error = e.message;
      setBusy(false);
      showVMSnackbar(e.message, err: true);
    }
  }
}
