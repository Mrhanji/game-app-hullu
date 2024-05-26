import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';

final dashBordProvider = ChangeNotifierProvider((e)=>_dashBord());

    class _dashBord extends ChangeNotifier{
        int currentPage=0;

        onChangePage(int index){
            currentPage=index;
            notifyListeners();
        }


    }