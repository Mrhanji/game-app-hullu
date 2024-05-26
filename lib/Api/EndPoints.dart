class EndPoints{

  static const String Login="/client/login";
  static const String Register="/client/register";

  static const String category="profile/getAllCategory";
  static  String getGamesByCategory({categoryId})=>"profile/getGameList/$categoryId";
  static String getGameByCategory({categoryId})=>"profile/getGameList/$categoryId";
  

  //Admin

 static const String getAllUpis="/admin/getUpis";
}