class Customer {
  int? customerId;
  String customerName;
  String mobile;
  String email;

  Customer({
  this.customerId,
  required this.customerName,
  required this.mobile,
  required this.email,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    print(json);

    return Customer(
  customerId: json['customerId'],
  customerName: json['customerName'].toString(),
  mobile: json['mobile'].toString(),
  email: json['email'].toString(),
  );
  }

  Map<String, dynamic> toJson() {
    return {
      "customerId": this.customerId,
      "customerName": this.customerName,
      "mobile": this.mobile,
      "email": this.email,
    };
  }

  //
}
