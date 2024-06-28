import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../views/widgets/snackbar.dart';
import '../models/navigator.dart';

export 'package:provider/provider.dart';
export 'package:spur/core/models/custom_exception.dart';
export 'package:spur/core/models/login_response.dart';
export 'package:spur/core/storage/local_storage.dart';

export '../../locator.dart';
export '../../views/widgets/custom_text.dart';

class BaseModel extends ChangeNotifier {
  bool _busy = false;

  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  log(dynamic data) {
    Logger l = Logger();
    l.d(data);
  }

  BuildContext get vmContext => AppNavigator.navKey.currentContext!;

  void showVMSnackbar(String title, {bool err = false}) {
    err ? errorSnackBar(vmContext, title) : successSnackBar(vmContext, title);
  }
}
