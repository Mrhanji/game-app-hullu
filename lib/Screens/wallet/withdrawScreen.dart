import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hullu/Screens/wallet/bankAccountScreen.dart';

import '../../Utils/app_config.dart';
import '../../Utils/functions.dart';


class WithDrawScreen extends ConsumerWidget {
  const WithDrawScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref,) {
    Size size=MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
       backgroundColor: Colors.white,
        elevation: 0,
       actions: [
         IconButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (builder)=>BankAccountScreen())), icon: Icon(CupertinoIcons.add),color: Colors.black,)
       ],
        leading: IconButton(icon: Icon(CupertinoIcons.left_chevron,color: Colors.black,),
          onPressed: ()=>Navigator.pop(context),),
        centerTitle: true,
        title: Text("Withdraw",style:
            GoogleFonts.poppins(fontWeight: FontWeight.w500,color: Colors.white) ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height*(0.52),
              //color: Colors.red,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    top: size.height*(0.01),
                    left: size.width*(0.77),
                    bottom: 0,
                    child: Container(
                      width: size.width,
                      height: size.height*(0.2),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 52,
                            top: 15,
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: ShapeDecoration(
                                color: Color(0xFF96BFFE),
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: ShapeDecoration(
                                color: Color(0xFFFED883),
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 44,
                            top: 60,
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: ShapeDecoration(
                                color: Color(0xFFFDB4BC),
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: size.height*(0.0),
                      left: size.width*(0.25),
                      child: Container(
                        //color: Colors.black,
                        child: Center(
                          child: Container(
                            height: size.height*(0.25),
                            width: size.width*(0.5),
                             child: Image.asset("assets/images/widthdraw.png",
                            fit: BoxFit.fill,),
                          ),
                        ),
                      )),
                  Positioned(
                    top: size.height*(0.25),
                    child: Container(
                      width: size.width,
                      padding: EdgeInsets.only(left: 5,right: 5),
                      child: Column(
                        children: [


                          Container(
                            width: size.width,
                            height: size.height*(0.065),
                            padding: EdgeInsets.only(left: 5,right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black38)
                            ),
                            // child: ref.watch(withdrawProvider).bankLoading?CupertinoActivityIndicator():DropdownButton(
                            //   underline: Text(""),
                            //   isExpanded: true,
                            //   onChanged: (d)=>ref.read(withdrawProvider).changeBank(d),
                            //   value: ref.watch(withdrawProvider).bankId==null?"0":ref.watch(withdrawProvider).bankId.toString(),
                            //   items: [
                            //     DropdownMenuItem(child: simpleText("Select Bank"),value: '0',enabled: false),
                            //
                            //    ...ref.watch(withdrawProvider).bankId==null? []:ref.watch(withdrawProvider).banksModel.data!.map((e) => DropdownMenuItem(child: simpleText("${e.bankName}:- ${e.accountNumber}"),value: "${e.bId}",)).toList()
                            //
                            //   ],
                            //
                            // ),
                          ),
                          SizedBox(height: size.height*(0.02),),

                          Container(
                            width: size.width,
                            height: size.height*(0.065),
                            padding: EdgeInsets.only(left: 5,right: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black38)
                            ),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              //controller: ref.read(withdrawProvider).amount,
                              decoration: InputDecoration(
                                hintText: "Amount",
                                border: InputBorder.none
                              ),
                            )
                          ),

                       SizedBox(height: size.height*(0.02),),
                       // primaryButton(simpleText("Submit",GoogleFonts.poppins(color: Colors.white,fontWeight:FontWeight.bold
                       // ) ), ()=>ref.read(withdrawProvider).addWithdraw(context,ref),size.width*(0.6)),
                       //    SizedBox(height: size.height*(0.01),),
                       //    Row(mainAxisAlignment: MainAxisAlignment.center,
                       //      children: [
                       //      Icon(CupertinoIcons.info_circle,size: size.height*(0.02),),
                       //      simpleText("Withdrawal request can take upto 48hrs to Complete.",GoogleFonts.poppins(
                       //        fontSize: size.height*(0.012)
                       //      ))
                       //    ],)






                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "Withdrawal Requests",
                      style:GoogleFonts.poppins(
                          fontSize: size.height*(0.02),
                          fontWeight: FontWeight.bold)),
                  Icon(CupertinoIcons.right_chevron)
                ],
              ),
            ),





            Container(child: ListView.builder(
              itemCount: 0,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context,i){
                var d;
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                      width: size.width,
                      // height: size.height*(0.07),
                      //padding: EdgeInsets.all(8),
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
                      child: ListTile(
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            d.wStatus==0?Icon(Icons.timer,color: Colors.amber,):d.wStatus==1?Icon(Icons.check_box,color: Colors.green,):Icon(Icons.close,color: Colors.red,),
                            Text("${AppConfig.appCurrency} ${d.amount}",
                               style: GoogleFonts.poppins(fontWeight: FontWeight.bold))
                          ],
                        ),
                        title: Text("${d.bankName}"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text("${FunctionsUtils.convertUnixTimeToDesired(int.parse(d.createdDateTime.toString()))}"),
                            // simpleText("Bank Details wrong. that’s why failed please try again.",GoogleFonts.poppins(
                            //   color: Colors.deepOrange,
                            //   fontSize: size.height*(0.016)
                            // )),
                          ],
                        ),
                      )
                  ),
                );
              },
            ))

          ],
        ),
      ),
    );
  }
}
