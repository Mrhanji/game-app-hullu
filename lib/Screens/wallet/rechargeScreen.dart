// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
//
//
//
// class RechargeScreen extends ConsumerWidget {
//   const RechargeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context,WidgetRef ref) {
//     var size=MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//
//         elevation: 0,
//         leading: IconButton(icon: Icon(CupertinoIcons.left_chevron,color: Colors.white,),
//           onPressed: ()=>null,),
//         centerTitle: true,
//         title: Text("Recharge",
//             style:GoogleFonts.poppins(fontWeight: FontWeight.w500,color: Colors.white) ),
//       ),
//
//       body: SingleChildScrollView(
//         child: ref.watch(walletProvider).upiHash==null?Center(child:Text("No Gateway Active ")):Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: size.height * 0.01,
//             ),
//             Center(
//                 child: Text(
//                   "Please Scan or Take Screenshot of this Qr Code",
//                   style: GoogleFonts.poppins(color: Colors.black),
//                 )),
//              QrImageView(
//                   data:ref.watch(walletProvider).upiHash.toString(),
//                   version: QrVersions.auto,
//                   //size: 320,
//                   gapless: true,
//                   //errorCorrectionLevel: 1,
//
//                   errorStateBuilder: (cxt, err) {
//                     return Container(
//                       child: Center(
//                         child: Text(
//                           'Uh oh! Something went wrong...',
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//
//
//             Text(
//               "Please Put UTR Number Below to Verify the payment.",
//               style: GoogleFonts.poppins(color: Colors.black),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 height: size.height * 0.08,
//                 width: size.width,
//                 padding: EdgeInsets.only(left: 10),
//                 decoration: BoxDecoration(
//                   //color: Colors.red
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(color: Colors.grey)),
//                 child: Center(
//                   child: TextField(
//                     keyboardType: TextInputType.number,
//                     controller: ref.read(walletProvider).amountText,
//                     decoration: InputDecoration(
//                         hintText: "Amount", border: InputBorder.none),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: size.height * 0.01,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 height: size.height * 0.08,
//                 width: size.width,
//                 padding: EdgeInsets.only(left: 10),
//                 decoration: BoxDecoration(
//                   //color: Colors.red
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(color: Colors.grey)),
//                 child: Center(
//                   child: TextField(
//                     controller: ref.read(walletProvider).utrController,
//                     decoration: InputDecoration(
//                         hintText: "UTR Number", border: InputBorder.none),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: size.height * 0.02,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: () => ref.read(walletProvider).submitNewRequest(ref,context),
//                   child: Container(
//                     height: size.height * 0.06,
//                     width: size.width * 0.7,
//                     decoration: BoxDecoration(
//                         color: ColorsConstant.primayButtonColor,
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Center(
//                       child: ref.watch(walletProvider).submitLoading
//                           ? CircularProgressIndicator(
//                         color: Colors.white,
//                       )
//                           : Text(
//                         "Verify",
//                         style: GoogleFonts.poppins(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w500,
//                             fontSize: size.height * 0.02),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: size.height * 0.02,
//             ),
//             Text(
//               "Recharge History",
//               style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
//             ),
//             Divider(),
//             ref.watch(walletProvider).rechargeRequestLoading
//                 ? CircularProgressIndicator(
//
//             )
//                 : ref.read(walletProvider).rechargeRequestModel.data!.length == 0
//                 ? Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text("No Requests Found"),
//             )
//                 : ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: ref.read(walletProvider).rechargeRequestModel.data!.length,
//               itemBuilder: (context, index) {
//                 var data=ref.read(walletProvider).rechargeRequestModel.data![index];
//                 return ListTile(
//                   leading: Text("${AppConfig.appCurrency}${data.amount}"),
//                   title: Text("${FunctionsUtils.convertUnixTimeToDesired(int.parse(data.dateTime.toString()))}"),
//                   subtitle: Text("${data.utr}"),
//                   trailing: Icon(
//                     data.status=="0"?Icons.timer:(data.status=="1"?Icons.check_circle:Icons.cancel),
//                     color: data.status=="0"?Colors.amber:(data.status=="1"?Colors.green:Colors.red),
//                   ),
//                 );
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
