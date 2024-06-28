class Country {
  String? name;
  String? dialCode;
  String? code;

  Country({this.name, this.code});
  Country.fromJson(dynamic json) {
    name = json['name'];
    dialCode = json['dial_code'];
    code = json['code'];
  }
}

class Currency {
  String? name;
  String? code;
  String? flag;

  Currency.fromJson(dynamic json) {
    name = json['name'];
    code = json['code'];
    flag = json['flag'];
  }
}
