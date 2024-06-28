import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';

import '../../core/models/country_model.dart';

Future push(BuildContext context, Widget page, [bool dialog = false]) async {
  FocusScope.of(context).unfocus();
  return await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page, fullscreenDialog: dialog),
  );
}

void pushReplacement(BuildContext context, Widget page) {
  FocusScope.of(context).unfocus();
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

Future<void> pushAndRemoveUntil(BuildContext context, Widget page) async {
  FocusScope.of(context).unfocus();
  await Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => page),
    (Route<dynamic> route) => false,
  );
}

class Utils {
  static String generateRandomString(int length) {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

  static List<String> get states => [
        "Abuja",
        "Abia",
        "Adamawa",
        "Akwa Ibom",
        "Anambra",
        "Bauchi",
        "Bayelsa",
        "Benue",
        "Borno",
        "Cross River",
        "Delta",
        "Ebonyi",
        "Edo",
        "Ekiti",
        "Enugu",
        "Gombe",
        "Imo",
        "Jigawa",
        "Kaduna",
        "Kano",
        "Katsina",
        "Kebbi",
        "Kogi",
        "Kwara",
        "Lagos",
        "Nasarawa",
        "Niger",
        "Ogun",
        "Ondo",
        "Osun",
        "Oyo",
        "Plateau",
        "Rivers",
        "Sokoto",
        "Taraba",
        "Yobe",
        "Zamfara",
      ];
  static String get googleKey => 'AIzaSyDa-Rb_DceGzTMkKuSPdPpMevXbzu1IKUY';
  static List<String> extractCityAndState(String desc) {
    List<String> parts = desc.split(',');
    String city = '';
    String state = '';

    if (parts.length >= 3) {
      city = parts[parts.length - 3].trim();
      state = parts[parts.length - 2].trim();
    } else if (parts.length == 2) {
      state = parts[0].trim();
    }

    return [city, state];
  }

  static void offKeyboard() async {
    await SystemChannels.textInput.invokeMethod<dynamic>('TextInput.hide');
  }

  static Future<List<Country>> getAllCountries() async {
    List<Country> counts = [];
    final String coins2 =
        await rootBundle.loadString('assets/cfg/countries.json', cache: false);
    List coinsResponse2 = jsonDecode(coins2);

    for (var value in coinsResponse2) {
      counts.add(Country.fromJson(value));
    }
    return [
      Country.fromJson({"name": "Nigeria", "dial_code": "+234", "code": "NG"})
    ];
  }

  static Future<DateTime?> chooseDate(BuildContext context,
      [DateTime? start]) async {
    Utils.offKeyboard();
    DateTime? a = await DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1910, 1, 1),
      maxTime: DateTime.now(),
      onChanged: (date) {},
      onConfirm: (date) {
        return date;
      },
      currentTime: start ?? DateTime.now(),
    );
    return a;
  }

  static String stringToDate(String a) {
    DateTime now = DateTime.now();
    DateTime then = DateTime.parse(a);

    if (now.year == then.year &&
        now.month == then.month &&
        now.day == then.day) {
      return 'Today';
    } else if (now.year == then.year &&
        now.month == then.month &&
        now.day - 1 == then.day) {
      return 'Yesterday';
    } else {
      return DateFormat('EEEE, MMM dd').format(DateTime.parse(a));
    }
  }

  static String? isValidPassword(String? value) {
    value = value!.trim();
    if (value.trim().isEmpty) {
      return "Password is required";
    } else if (value.trim().length < 8) {
      return "Password is too short";
    } else if (!value.trim().contains(RegExp(r'\d'))) {
      return "Password must contain a number";
    } else if (!value.trim().contains(RegExp(r'[a-z]'))) {
      return "Password must contain a lowercase letter";
    } else if (!value.trim().contains(RegExp(r'[A-Z]'))) {
      return "Password must contain a uppercase letter";
    } /*else if (!value.trim().contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "Password must contain a special character";
    }*/
    return null;
  }

  static String? isValidName(String? value, String type, int length) {
    if (value!.isEmpty) {
      return '$type cannot be Empty';
    } else if (value.length < length) {
      return '$type is too short';
    } else if (value.length > 100) {
      return '$type max length is 100';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    value = value!.trim();
    final RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\])|(([a-zA-Z\-\d]+\.)+[a-zA-Z]{2,}))$');
    if (value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!regex.hasMatch(value)) {
      return 'Enter valid email';
    } else {
      return null;
    }
  }
}

extension CustomStringExtension on String {
  toTitleCase() {
    final words = toString().toLowerCase().split(' ');
    var newWord = '';
    for (var word in words) {
      if (word.isNotEmpty) {
        newWord += '${word[0].toUpperCase()}${word.substring(1)} ';
      }
    }

    return newWord;
  }

  Color hexStringToColor() {
    String hexColor = this;
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor'; // Add FF for opaque color if not provided
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  toAmount() {
    return NumberFormat("#,##0.00", "en_US")
        .format(double.tryParse(this) ?? 0.00);
  }

  getSingleInitial() {
    return split('')[0].toUpperCase();
  }

  sanitizeToDouble() {
    return double.tryParse(replaceAll(",", ""));
  }
}

class PhoneNumFormatter extends TextInputFormatter {
  PhoneNumFormatter(this.code) : super();
  final String code;
  @override
  TextEditingValue formatEditUpdate(oldValue, newValue) {
    String newVal = newValue.text;
    if ('+'.allMatches(newVal).length > 1) return oldValue;
    if (!newVal.startsWith(code)) return oldValue;
    List<String> a = newVal.split('');
    if (a.any((e) => !e.contains(RegExp(r'[0-9]')) && e != ' ' && e != '+')) {
      return oldValue;
    }
    if (code.length + 2 > newVal.length) {
      return oldValue;
    }
    return newValue;
  }
}
