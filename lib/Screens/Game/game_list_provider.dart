import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/Api/Features/FeaturesApi.dart';
import '/Repo/Game/GameListResponse.dart';



final gameListProvider=ChangeNotifierProvider.autoDispose((ref) => _gameListProvider());


class _gameListProvider extends ChangeNotifier{
  GameListResponse gameListResponse=GameListResponse();
  bool gameLoading=true;


  onInit(id)async{

    gameListResponse=await FeatureApi().getCategoryGames(categoryId: id);
    gameLoading=false;
    notifyListeners();

  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

}