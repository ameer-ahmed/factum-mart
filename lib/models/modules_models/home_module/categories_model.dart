class FactumMartHomeModuleCategoriesModel {
  bool? status;
  String? message;
  List<FactumMartHomeModuleCategoriesDataModel>? data = [];

  FactumMartHomeModuleCategoriesModel.fromMap(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    json['data'].forEach((element) {
      data!.add(FactumMartHomeModuleCategoriesDataModel.fromMap(element));
    });
  }
}

class FactumMartHomeModuleCategoriesDataModel {
  String? id;
  String? name;
  String? icon;
  FactumMartHomeModuleCategoriesDataModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
  }
}
