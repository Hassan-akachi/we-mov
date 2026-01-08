import '../utils/constants.dart';


class ResponseModel {
  ResponseStatus? responseStatus;
  int? statusCode;
  String? message;
  Map<String, dynamic>? object;

  ResponseModel({
    // Everything is now optional and defaults to null
    this.responseStatus,
    this.statusCode,
    this.message,
    this.object,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      // Safely check if the key exists before attempting to find the enum
      responseStatus: json["responseStatus"] != null
          ? ResponseStatus.values.firstWhere(
            (e) => e.name == json["responseStatus"],
        orElse: () => ResponseStatus.NONE,
      )
          : null,
      statusCode: json["statusCode"],
      message: json["message"],
      object: json["object"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // Use the null-aware operator ?. to avoid errors if status is null
      "responseStatus": responseStatus?.name,
      "statusCode": statusCode,
      "message": message,
      "object": object,
    };
  }
}