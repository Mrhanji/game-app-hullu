import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hullu/Screens/Profile/profileScreen.dart';
import '/Screens/Auth/login_screen.dart';
import '/Screens/Category/category_screen.dart';
import '/Screens/DashBoard/dash_board_provider.dart';
import '../Home/home_screen.dart';

class DashBoard extends ConsumerWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (e)=>ref.read(dashBordProvider).onChangePage(e),
        currentIndex: ref.watch(dashBordProvider).currentPage,
        items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home,),label: "Home"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.grid,),label: "Category"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_alt,),label: "Profile",),
        ],
      ),
      body: IndexedStack(
       index: ref.watch(dashBordProvider).currentPage,
        children: [
          HomeScreen(),
          CategoryScreen(),
          ProfileScreen()
        ],
      ),
    );
  }
}