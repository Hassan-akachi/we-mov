class AuthResponseModel {
  int statusCode;
  String message;
  String accessToken;
  int loginTime;
  int expirationDuration;

  AuthResponseModel({
    required this.statusCode,
    required this.message,
    required this.accessToken,
    required this.loginTime,
    required this.expirationDuration,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      // ⭐ FIX: Check if it's already an int; if not, parse it.
      statusCode: json["statusCode"] is int
          ? json["statusCode"]
          : int.parse(json["statusCode"].toString()),

      message: json["message"] ?? "",
      accessToken: json["accessToken"] ?? "",

      // ⭐ FIX: Avoid calling int.parse on integers
      loginTime: json["loginTime"] is int
          ? json["loginTime"]
          : int.parse(json["loginTime"].toString()),

      expirationDuration: json["expirationDuration"] is int
          ? json["expirationDuration"]
          : int.parse(json["expirationDuration"].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "statusCode": statusCode,
      "message": message,
      "accessToken": accessToken,
      "loginTime": loginTime,
      "expirationDuration": expirationDuration,
    };
  }
}