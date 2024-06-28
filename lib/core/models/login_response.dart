class LoginResponse {
  UserModel? user;
  Tokens? tokens;
  String? token;
  String? updateUserToken;
  String? twofactorLoginToken;
  Business? business;

  LoginResponse({token, tokens, user});
  LoginResponse.fromJson(dynamic json) {
    token = json['token'];
    updateUserToken = json['updateUserToken'];
    twofactorLoginToken = json['twofactorLoginToken'];

    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    tokens = json['tokens'] != null ? Tokens.fromJson(json['tokens']) : null;
    business = json['business'] != null || json?['user']?['business'] != null
        ? Business.fromJson(json['business'] ?? json?['user']?['business'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (tokens != null) {
      data['tokens'] = tokens!.toJson();
    }
    data['token'] = token;
    data['twofactorLoginToken'] = twofactorLoginToken;
    data['updateUserToken'] = updateUserToken;
    if (business != null) {
      data['business'] = business!.toJson();
    }
    return data;
  }
}

class UserModel {
  String? businessName;
  String? email;
  String? phoneNumber;
  String? dialCode;
  String? role;
  bool? isEmailVerified;
  bool? isPhoneVerified;
  bool? bvnValidated;
  bool? isTransactionPinSet;
  bool? active;
  int? failedLoginAttempts;
  String? userType;
  List? permissions;
  bool? blackListed;
  bool? deleted;
  String? id;
  String? userName;
  String? firstName;
  String? lastName;
  bool? allow2fa;
  bool? hasDefaultPassword;

  UserModel.fromJson(dynamic json) {
    userName = json['userName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    allow2fa = json['allow2fa'];
    hasDefaultPassword = json['hasDefaultPassword'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    dialCode = json['dialCode'];
    role = json['role'];
    isEmailVerified = json['isEmailVerified'];
    isPhoneVerified = json['isPhoneVerified'];
    isTransactionPinSet = json['isTransactionPinSet'];
    bvnValidated = json['bvnValidated'];
    active = json['active'];
    failedLoginAttempts = json['failedLoginAttempts'];
    userType = json['userType'];
    if (json['permissions'] != null) {
      permissions = [];
    }
    blackListed = json['blackListed'];
    deleted = json['deleted'];

    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['allow2fa'] = allow2fa;
    data['hasDefaultPassword'] = hasDefaultPassword;

    data['businessName'] = businessName;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['dialCode'] = dialCode;
    data['role'] = role;
    data['isEmailVerified'] = isEmailVerified;
    data['isPhoneVerified'] = isPhoneVerified;
    data['bvnValidated'] = bvnValidated;
    data['isTransactionPinSet'] = isTransactionPinSet;
    data['active'] = active;
    data['failedLoginAttempts'] = failedLoginAttempts;
    data['userType'] = userType;
    if (permissions != null) {
      data['permissions'] = permissions;
    }
    data['blackListed'] = blackListed;
    data['deleted'] = deleted;

    data['id'] = id;
    return data;
  }
}

class Business {
  String? user;
  String? businessName;
  bool? verified;
  bool? cacValidated;
  bool? active;
  String? id;

  Business({user, businessName, verified, cacValidated, active, id});

  Business.fromJson(dynamic json) {
    user = json['user'];
    businessName = json['businessName'];
    verified = json['verified'];
    cacValidated = json['cacValidated'];
    active = json['active'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user;
    data['businessName'] = businessName;
    data['verified'] = verified;
    data['cacValidated'] = cacValidated;
    data['active'] = active;
    data['id'] = id;
    return data;
  }
}

class Tokens {
  Access? access;
  Access? refresh;

  Tokens({access, refresh});

  Tokens.fromJson(dynamic json) {
    access = json['access'] != null ? Access.fromJson(json['access']) : null;
    refresh = json['refresh'] != null ? Access.fromJson(json['refresh']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (access != null) {
      data['access'] = access!.toJson();
    }
    if (refresh != null) {
      data['refresh'] = refresh!.toJson();
    }
    return data;
  }
}

class Access {
  String? token;
  String? expires;

  Access({token, expires});

  Access.fromJson(dynamic json) {
    token = json['token'];
    expires = json['expires'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['expires'] = expires;
    return data;
  }
}

class KycModel {
  String? sId;
  ProofOfAddress? proofOfAddress;
  Identity? identity;
  Bvn? bvn;
  int? accountTier;
  List? history;

  KycModel(
      {this.sId,
      this.proofOfAddress,
      this.identity,
      this.bvn,
      this.accountTier,
      this.history});

  KycModel.fromJson(dynamic json) {
    sId = json['_id'];
    proofOfAddress = json['proofOfAddress'] != null
        ? ProofOfAddress.fromJson(json['proofOfAddress'])
        : null;
    identity =
        json['identity'] != null ? Identity.fromJson(json['identity']) : null;
    bvn = json['bvn'] != null ? Bvn.fromJson(json['bvn']) : null;
    accountTier = json['accountTier'] ?? 0;
    if (json['history'] != null) {
      history = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (proofOfAddress != null) {
      data['proofOfAddress'] = proofOfAddress!.toJson();
    }
    if (identity != null) {
      data['identity'] = identity!.toJson();
    }
    if (bvn != null) {
      data['bvn'] = bvn!.toJson();
    }
    data['accountTier'] = accountTier;
    if (history != null) {
      data['history'] = history!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProofOfAddress {
  String? address;
  bool? addressValidated;
  String? addressRejectionReason;
  String? addressValidationDate;
  String? proof;
  String? status;
  String? applicationDate;

  ProofOfAddress(
      {this.address,
      this.addressValidated,
      this.addressRejectionReason,
      this.addressValidationDate,
      this.proof,
      this.status,
      this.applicationDate});

  ProofOfAddress.fromJson(dynamic json) {
    address = json['address'];
    addressValidated = json['addressValidated'];
    addressRejectionReason = json['addressRejectionReason'];
    addressValidationDate = json['addressValidationDate'];
    proof = json['proof'];
    status = json['status'];
    applicationDate = json['applicationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['addressValidated'] = addressValidated;
    data['addressRejectionReason'] = addressRejectionReason;
    data['addressValidationDate'] = addressValidationDate;
    data['proof'] = proof;
    data['status'] = status;
    data['applicationDate'] = applicationDate;
    return data;
  }
}

class Identity {
  String? expiryDate;
  String? issueDate;

  Identity({this.expiryDate, this.issueDate});

  Identity.fromJson(dynamic json) {
    expiryDate = json['expiryDate'];
    issueDate = json['issueDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['expiryDate'] = expiryDate;
    data['issueDate'] = issueDate;
    return data;
  }
}

class Bvn {
  bool? validated;
  String? number;
  String? validationDate;
  String? validationMessage;

  Bvn({this.validated, this.number});

  Bvn.fromJson(dynamic json) {
    validated = json['validated'];
    number = json['number'];
    validationDate = json['validationDate'];
    validationMessage = json['validationMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['validated'] = validated;
    data['number'] = number;
    data['validationDate'] = validationDate;
    data['validationMessage'] = validationMessage;
    return data;
  }
}
