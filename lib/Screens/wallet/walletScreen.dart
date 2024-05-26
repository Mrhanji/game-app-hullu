// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:ledocity_app/core/utils/functions.dart';
// import 'package:ledocity_app/providers/wallet/walletProvider.dart';
// import 'package:ledocity_app/routes/routes_constant.dart';
// import '../../../providers/home/homeProvider.dart';
// import '/core/utils/image_constant.dart';
// import '/core/widget/buttons_widget.dart';
// import '../../../core/utils/config.dart';
// import '../../../core/utils/extra_constants.dart';
// import '../../../core/widget/text_widgets.dart';
//
//
// class WalletScreen extends ConsumerWidget {
//   const WalletScreen({super.key});
//
//   @override
//   Widget build(BuildContext context,WidgetRef ref) {
//     if(ref.watch(walletProvider).myId==null) {
//       ref.read(walletProvider).onInit(context, ref
//           .read(HomeProvider)
//           .loginModel
//           .data!
//           .uId);
//     }
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: HexColor("5f259e"),
//         elevation: 0,
//         leading: IconButton(icon: Icon(CupertinoIcons.left_chevron,color: Colors.white,),
//           onPressed: ()=>context.pop(),),
//         centerTitle: true,
//         title: simpleText("Wallet",
//             GoogleFonts.poppins(fontWeight: FontWeight.w500,color: Colors.white) ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             width: deviceWidth(),
//             height: deviceHeight(0.37),
//             //color: Colors.red,
//             child: Stack(
//               fit: StackFit.expand,
//               children: [
//                 Positioned(
//                   top: deviceHeight(0.01),
//                   left: deviceWidth(0.77),
//                   bottom: 0,
//                   child: Container(
//                     width: deviceWidth(),
//                     height: deviceHeight(0.2),
//                     child: Stack(
//                       children: [
//                         Positioned(
//                           left: 52,
//                           top: 15,
//                           child: Container(
//                             width: 15,
//                             height: 15,
//                             decoration: ShapeDecoration(
//                               color: Color(0xFF96BFFE),
//                               shape: OvalBorder(),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           left: 0,
//                           top: 0,
//                           child: Container(
//                             width: 20,
//                             height: 20,
//                             decoration: ShapeDecoration(
//                               color: Color(0xFFFED883),
//                               shape: OvalBorder(),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           left: 44,
//                           top: 60,
//                           child: Container(
//                             width: 15,
//                             height: 15,
//                             decoration: ShapeDecoration(
//                               color: Color(0xFFFDB4BC),
//                               shape: OvalBorder(),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                     top: deviceHeight(0.0),
//                     left: deviceWidth(0.25),
//                     child: Container(
//                       //color: Colors.black,
//                       child: Center(
//                         child: Container(
//                           height: deviceHeight(0.25),
//                           width: deviceWidth(0.5),
//                           child: Image.asset(ImageConstant.walletImage,
//                           fit: BoxFit.fill,),
//                         ),
//                       ),
//                     )),
//                 Positioned(
//                   top: deviceHeight(0.25),
//                   child: Container(
//                     width: deviceWidth(),
//                     child: Column(
//                       children: [
//
//
//                         Container(
//                           width: deviceWidth(),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Column(
//                                 children: [
//                                   Icon(
//                                     Icons.wallet,
//                                     size: deviceHeight(0.05),
//                                   ),
//                                   simpleText(
//                                       '${AppConfig.appCurrency}${ref.read(HomeProvider).loginModel.data!.walletAmount}',
//                                       GoogleFonts.poppins(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: deviceHeight(0.02))),
//                                   simpleText(
//                                       'Wallet Amount',
//                                       GoogleFonts.poppins(
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: deviceHeight(0.015),
//                                           color: Colors.grey.shade500)),
//                                 ],
//                               ),
//                               VerticalDivider(
//                                 thickness: 2,
//                                 color: Colors.black,
//                               ),
//
//                               successButton(
//                                   simpleText("Add Money +",
//                                   GoogleFonts.poppins(color: Colors.white,
//                                   fontWeight: FontWeight.w500)
//                                   ),
//                                   ()=>GoRouter.of(context).push(RoutesConstant.RechargeScreen),deviceWidth(0.45))
//
//                             ],
//                           ),
//                         ),
//
//                         //
//
//
//
//
//
//
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           ref.watch(walletProvider).transactionsLoading?Center(child: CupertinoActivityIndicator(),)
//               :Expanded(child: ListView.builder(
//             itemCount: ref.read(walletProvider).model.data!.length,
//             itemBuilder: (context,i){
//               var data= ref.read(walletProvider).model.data![i];
//               return Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: Container(
//                     width: deviceWidth(),
//                     // height: deviceHeight(0.07),
//                     //padding: EdgeInsets.all(8),
//                     decoration: ShapeDecoration(
//                       color: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         side: BorderSide(
//                           width: 1,
//                           strokeAlign: BorderSide.strokeAlignCenter,
//                           color: Color(0xFFE8F0FF),
//                         ),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     child: ListTile(
//                       trailing: data.transactionType.toString()=='credit'?Icon(CupertinoIcons.arrow_down_left,color: Colors.green,):Icon(CupertinoIcons.arrow_up_right,color: Colors.red,),
//                       title: simpleText("${AppConfig.appCurrency}${data.transactionAmount} ${data.transactionInfo}"),
//                       subtitle: simpleText("${FunctionsUtils.convertUnixTimeToDesired(int.parse(data.transactionDate.toString()))}"),
//                     )
//                 ),
//               );
//             },
//           ))
//         ],
//       ),
//     );
//   }
// }
