// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
//
// import '../../../core/utils/config.dart';
// import '../../../core/utils/extra_constants.dart';
// import '../../../core/utils/functions.dart';
// import '../../../core/widget/text_widgets.dart';
// import '../../../providers/home/homeProvider.dart';
// import '../../../providers/wallet/walletProvider.dart';
//
// class TotalIncomeScreen extends ConsumerWidget {
//    TotalIncomeScreen({super.key});
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
//         title: simpleText("Total Income",
//             GoogleFonts.poppins(fontWeight: FontWeight.w500,color: Colors.white) ),
//       ),
//
//       body: ref.watch(walletProvider).transactionsLoading?Center(child: CupertinoActivityIndicator(),)
//           :ListView(
//         children: [
//           ...ref.read(walletProvider).model.data!.where((element) => (element.transactionType.toString()=='credit'
//               && element.transactionInfo.toString()=='Income From Plan')).map((e) =>
//               Padding(
//         padding: const EdgeInsets.all(5.0),
//         child: Container(
//             width: deviceWidth(),
//             // height: deviceHeight(0.07),
//             //padding: EdgeInsets.all(8),
//             decoration: ShapeDecoration(
//               color: Colors.white,
//               shape: RoundedRectangleBorder(
//                 side: BorderSide(
//                   width: 1,
//                   strokeAlign: BorderSide.strokeAlignCenter,
//                   color: Color(0xFFE8F0FF),
//                 ),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//             child: ListTile(
//               trailing: e.transactionType.toString()=='credit'?Icon(CupertinoIcons.arrow_down_left,color: Colors.green,):Icon(CupertinoIcons.arrow_up_right,color: Colors.red,),
//               title: simpleText("${AppConfig.appCurrency}${e.transactionAmount} ${e.transactionInfo}"),
//               subtitle: simpleText("${FunctionsUtils.convertUnixTimeToDesired(int.parse(e.transactionDate.toString()))}"),
//             )
//         ),
//       )
//           )
//           ]
//         ,
//       ),
//     );
//   }
// }
