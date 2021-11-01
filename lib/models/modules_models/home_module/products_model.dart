import 'package:factum_mart/shared/network/end_points.dart';

class FactumMartHomeModuleProductsModel {
  bool? status;
  String? message;
  List<FactumMartHomeModuleProductsDataModel>? data = [];

  FactumMartHomeModuleProductsModel.fromMap(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      json['data'].forEach((element) {
        data!.add(FactumMartHomeModuleProductsDataModel.fromMap(element));
      });
    } else {
      data = null;
    }
  }
}

class FactumMartHomeModuleProductsDataModel {
  int? id;
  String? name;
  num? price;
  num? oldPrice;
  String? image;

  FactumMartHomeModuleProductsDataModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    oldPrice = json['old_price'];
    image = baseUrl + imageEndPoint + json['unique_name'];
  }
}
