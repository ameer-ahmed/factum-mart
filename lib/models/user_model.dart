class FactumMartUserModel {
  bool? status;
  String? message;
  FactumMartUserDataModel? data;

  FactumMartUserModel.fromMap(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? FactumMartUserDataModel.fromMap(json['data'])
        : null;
  }
}

class FactumMartUserDataModel {
  int? id;
  String? username;
  String? email;
  String? name;
  String? token;

  FactumMartUserDataModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    name = json['name'];
    token = json['token'];
  }
}
