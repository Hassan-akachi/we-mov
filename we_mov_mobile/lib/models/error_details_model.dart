class ErrorDetails {
  int? errorCode;
  String? errorMessage;
  String? devErrorMessage;
  int? timestamp;

  ErrorDetails({
    this.errorCode,
    this.errorMessage,
    this.devErrorMessage,
    this.timestamp,
  });

  // Factory to convert JSON Map to ErrorDetails Object
  factory ErrorDetails.fromJson(Map<String, dynamic> json) {
    return ErrorDetails(
      // Safely handle potential nulls or wrong types from API
      errorCode: json["errorCode"] is String
          ? int.tryParse(json["errorCode"])
          : json["errorCode"],
      errorMessage: json["errorMessage"],
      devErrorMessage: json["devErrorMessage"],
      timestamp: json["timestamp"] is String
          ? int.tryParse(json["timestamp"])
          : json["timestamp"],
    );
  }

  // Method to convert ErrorDetails Object back to JSON Map
  Map<String, dynamic> toJson() {
    return {
      "errorCode": errorCode,
      "errorMessage": errorMessage,
      "devErrorMessage": devErrorMessage,
      "timestamp": timestamp,
    };
  }
}