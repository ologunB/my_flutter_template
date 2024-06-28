import 'package:hive_flutter/hive_flutter.dart';
import 'package:spur/core/apis/base_api.dart';
import 'package:spur/core/models/login_response.dart';

class AppCache {
  static const String kUserBox = 'userBoxx';
  static const String kDefaultBox = 'defaultBoxx';
  static const String userKey = 'userKeyccrgddewr';
  static const String kycKey = 'kycKeyccrgddewr';
  static const String countryKey = 'countryKcceyfdffrgewr';
  static const String allBanksKey = 'allBanksKcceyfdffrgewr';
  static const String appPinKey = 'appPinKeyfdffrgewr';
  static const String message2faKey = 'message2faKeyfrgewr';
  static const String appPassKey = 'appPassKeyfdffrgewr';
  static const String showBannerKey = 'hideBannerKeyfdffrgewr';
  static const String isTestKey = 'isTestKeyKeyfjhjdffrgewr';
  static const String kycLevelBannerKey = 'kycLevelBannerKeyffrgewr';
  static const String showBalanceKey = 'showBalanceKeyfdffrgewr';
  static const String lastUsedWalletKey = 'lastUsedWalletKeyfdffrgewr';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<dynamic>(kUserBox);
    await Hive.openBox<dynamic>(kDefaultBox);
  }

  static Box<dynamic> get _userBox => Hive.box<dynamic>(kUserBox);
  static Box<dynamic> get _defaultBox => Hive.box<dynamic>(kDefaultBox);

  static List<UserModel> getBanks() {
    List? all = _defaultBox.get(allBanksKey);
    List<UserModel> banks = [];
    if (all == null) return banks;
    for (var e in all) {
      banks.add(UserModel.fromJson(e));
    }
    return banks;
  }

  static void setBanks(List<UserModel> banks) {
    List<Map<String, dynamic>> all = [];
    for (var e in banks) {
      all.add(e.toJson());
    }
    _defaultBox.put(allBanksKey, all);
  }

  static Future<void> setUser(LoginResponse a) async {
    await _userBox.put(userKey, a.toJson());
  }

  static LoginResponse? getUser() {
    dynamic d = _userBox.get(userKey);
    if (d == null) return null;
    return LoginResponse.fromJson(d);
  }

  static Future<void> clear() async {
    await _userBox.clear();
  }

  static void clean(String key) {
    _userBox.delete(key);
  }
}
