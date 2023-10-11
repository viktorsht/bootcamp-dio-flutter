class ThingsModel {
  String? message;
  String? error;
  int? statusCode;

  ThingsModel({this.message, this.error, this.statusCode});

  ThingsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['error'] = error;
    data['statusCode'] = statusCode;
    return data;
  }
}
