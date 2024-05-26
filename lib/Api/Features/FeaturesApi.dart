import 'dart:convert';
import '/Repo/Game/GameListResponse.dart';
import '/Api/EndPoints.dart';
import '/Repo/Category/CategoryModel.dart';
import '/Services/HttpServices.dart';

class FeatureApi{

  Future<CategoryModel> getCategory()async{
    var data=await HttpServices().getServices(EndPoints.category);
     return CategoryModel.fromJson(jsonDecode(data.body));
  }



  Future<GameListResponse>getCategoryGames({categoryId})async{
    var data=await HttpServices().getServices(EndPoints.getGameByCategory(categoryId: categoryId));
    return GameListResponse.fromJson(jsonDecode(data.body));
  }
}