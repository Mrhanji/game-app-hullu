import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hullu/Screens/refer/referScreen.dart';
import '../../Utils/app_config.dart';
import '../wallet/withdrawScreen.dart';


class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              //height: size.height*0.1,
              width: size.width,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: size.height * 0.05,
                      width: size.height * 0.05,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19),
                          color: Colors.black,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://m.media-amazon.com/images/I/51uNuaA5axL._UX358_FMwebp_QL85_.jpg"),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  Spacer(),
                  Visibility(
                    visible: true,
                    child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: IconButton(
                          onPressed: (){},
                          tooltip: "Download App",
                          icon: Icon(CupertinoIcons.arrow_down_circle),
                        )
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.height*0.12,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Column(

                  children: [
                    SizedBox(height: size.height*0.01,),
                    Row(
                      children: [
                        Icon(CupertinoIcons.person_alt,color: Colors.green,
                        size: size.height*0.08,),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Full Name-> Vicky Dobri",style: GoogleFonts.macondo(
                                fontWeight: FontWeight.bold,
                                fontSize: size.height*0.023
                            ),),
SizedBox(height: 10,),
                            Text("ID #2342331",style: GoogleFonts.macondo(
                                fontWeight: FontWeight.bold,
                                fontSize: size.height*0.023
                            ),),
                            SizedBox(height: 10,),

                            Text("Mobile-> 983437847",style: GoogleFonts.macondo(
                                fontWeight: FontWeight.bold,
                                fontSize: size.height*0.02
                            ),),

                          ],
                        ),
                      )

                      ],
                    )
                  ],
                ),
              ),
            ),
            //SizedBox(height: size.height*0.01),
            Divider(
              thickness: 0.5,
            ),
            Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    // onTap: ()=>context.push(RoutesConstant.WalletRoute),
                    child: Column(
                      children: [
                        SizedBox(
                         // height:size.height*(0.05),
                          width: size.width*(0.1),
                          //   child: SvgPicture.asset(ImageConstant.walletIcon,
                          //),
                        ),
                        Text(
                            '${AppConfig.appCurrency} 15',
                            style:GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: size.height*(0.025))),
                        Text(
                            'Wallet Amount',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: size.height*(0.016),
                                color: Colors.grey.shade500)),
                      ],
                    ),
                  ),
                  VerticalDivider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                  InkWell(
                    //onTap: ()=>context.push(RoutesConstant.TotalIncomeScreen),
                    child: Column(
                      children: [

                        Text(
                            '${AppConfig.appCurrency}3',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: size.height*(0.025))),
                        Text(
                            'Total Income',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: size.height*(0.016),
                                color: Colors.grey.shade500)),
                      ],
                    ),
                  ),
                ],
              ),
            ),



            Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                //onTap: ()=>context.push(RoutesConstant.WithdrawRoute),
                child: Container(
                  width: size.width,
                  height: size.height*(0.07),
                  padding: EdgeInsets.all(8),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFE8F0FF),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "Change Password",
                            style:   GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: size.height*(0.02))),
                        Icon(CupertinoIcons.right_chevron)
                      ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: ()=>    Navigator.push(context, MaterialPageRoute(builder: (c)=>WithDrawScreen())),
                child: Container(
                  width: size.width,
                  height: size.height*(0.07),
                  padding: EdgeInsets.all(8),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFE8F0FF),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "Withdraw Wallet",
                            style:   GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: size.height*(0.02))),
                        Icon(CupertinoIcons.right_chevron)
                      ]),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: ()=>    Navigator.push(context, MaterialPageRoute(builder: (c)=>ReferScreen())),
                child: Container(
                  width: size.width,
                  height: size.height*(0.07),
                  padding: EdgeInsets.all(8),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFE8F0FF),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "Refer a Friend",
                            style:GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: size.height*(0.02))),
                        Icon(CupertinoIcons.right_chevron)
                      ]),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                // onTap: ()=>FunctionsUtils.launchUrls(ref.read(HomeProvider).settingsModel.data!.settings!.first.termsConditions),
                child: Container(
                  width: size.width,
                  height: size.height*(0.07),
                  padding: EdgeInsets.all(8),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFE8F0FF),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "Terms & Condition",
                            style:   GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: size.height*(0.02))),
                        Icon(CupertinoIcons.right_chevron)
                      ]),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
               onTap: ()=>logOut(context),
                child: Container(
                  width: size.width,
                  height: size.height*(0.07),
                  padding: EdgeInsets.all(8),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFE8F0FF),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "Logout",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: size.height*(0.02))),
                        Icon(CupertinoIcons.right_chevron)
                      ]),
                ),
              ),
            ),

            Text("Version ${AppConfig.appVersion}",
                style:GoogleFonts.poppins(color: Colors.grey)),

          ],
        ),
      ),
    );
  }
}
logOut(BuildContext context)async{
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Logout'),
        content: Text('Are you sure you want to logout?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // No button
            },
            child: Text('No',style: GoogleFonts.poppins(color: Colors.red),),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true); // Yes button
            },
            child: Text('Yes'),
          ),
        ],
      );
    },
  ).then((value)async {
    if (value != null && value) {
      // Perform logout action here
      print('User logged out');
      // await LocalDb().logOut();
      // notifyListeners();
      // context.pushReplacement(RoutesConstant.onBoardingRoute);
    }
  });

}