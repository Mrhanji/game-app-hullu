import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hullu/Api/Features/FeaturesApi.dart';
import '/Repo/Category/CategoryModel.dart';


final homeProvider= ChangeNotifierProvider((ref) {
  var d=_homeProvider();
  d.onInit();
  return d;
});

class _homeProvider extends ChangeNotifier{

  CategoryModel categoryModel=CategoryModel();
  bool categoryLoading=true;

  List<Products>productData=[
    Products(1, "Gold Ring", "Sample Gold ring", "https://pngimg.com/uploads/ring/ring_PNG8.png", 244.1, 399.2),
    Products(2, "Luxury 2 Watch with life time warinty", "Sample Gold ring", "https://parspng.com/wp-content/uploads/2023/06/watchpng.parspng.com-10.png", 144.1, 199.2),
    Products(3, "Gold Ear Rings with 23k Gold", "Sample Gold ring", "https://i.pinimg.com/originals/5f/74/c0/5f74c0334fcf9558e1e1902ce49bdac5.png", 333.1, 423.2),



  ];
  List<String>banners=[];



  onInit()async{
    categoryModel=await FeatureApi().getCategory();
    categoryLoading=false;
    notifyListeners();
  }

}








class Products{
  int? productId;
  String? productTitle;
  String? productInfo;
  String? productImage;
  double? price;
  double? mrp;

  Products(this.productId, this.productTitle, this.productInfo,
      this.productImage, this.price, this.mrp);
}