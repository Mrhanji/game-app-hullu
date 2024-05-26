
class CategoryModel {
  int? statusCode;
  String? message;
  List<CategoryData>? data;
  String? errorCode;
  String? errorMessage;

  CategoryModel({this.statusCode, this.message, this.data, this.errorCode, this.errorMessage});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    statusCode = json["statusCode"];
    message = json["message"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => CategoryData.fromJson(e)).toList();
    errorCode = json["errorCode"];
    errorMessage = json["errorMessage"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["statusCode"] = statusCode;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["errorCode"] = errorCode;
    _data["errorMessage"] = errorMessage;
    return _data;
  }
}

class CategoryData {
  int? categoryId;
  String? categoryTitle;
  String? categoryInfo;
  String? categoryImage;
  String? categoryType;

  CategoryData({this.categoryId, this.categoryTitle, this.categoryInfo, this.categoryImage, this.categoryType});

  CategoryData.fromJson(Map<String, dynamic> json) {
    categoryId = json["category_id"];
    categoryTitle = json["category_title"];
    categoryInfo = json["category_info"];
    categoryImage = json["category_image"];
    categoryType = json["category_type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["category_id"] = categoryId;
    _data["category_title"] = categoryTitle;
    _data["category_info"] = categoryInfo;
    _data["category_image"] = categoryImage;
    _data["category_type"] = categoryType;
    return _data;
  }
}