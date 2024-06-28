import '../apis/auth_api.dart';
import 'base_vm.dart';

class AuthViewModel extends BaseModel {
  final AuthApi _api = locator<AuthApi>();
  String? error;

  LoginResponse? loginResponse;

  Future<bool> signup(Map<String, dynamic> a) async {
    setBusy(true);
    try {
      LoginResponse res = await _api.signup(a);
      vmContext.read<AuthViewModel>().loginResponse = res;

      showVMSnackbar('Verify your account');
      setBusy(false);
      return true;
    } on BlumeException catch (e) {
      error = e.message;
      setBusy(false);
      showVMSnackbar(e.message, err: true);
      return false;
    }
  }
}
