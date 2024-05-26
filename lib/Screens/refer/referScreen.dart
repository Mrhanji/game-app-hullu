import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';


class ReferScreen extends ConsumerWidget {
  const ReferScreen({super.key});

  @override
   Widget build(BuildContext context,WidgetRef ref) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        centerTitle: true,
        title: Text("Refer & Earn",style:
            GoogleFonts.poppins(fontWeight: FontWeight.w500,color: Colors.white) ),
      ),
      
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 5,right: 5),
        child: Container(
          //height: size.height(),
          width: size.width,
          padding: EdgeInsets.only(left: 5,right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/refer.png"),
                ],
              ),
              Divider(thickness: 1.5,),


              // simpleText("1 Total Refer",GoogleFonts.poppins(
              //   fontWeight: FontWeight.bold,
              //   fontSize: size.height(0.02)
              // ) ),


              InkWell(
                onTap: ()async{
                     //await share(ref.read(HomeProvider).loginModel.data!.referCode);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top:8.0,bottom: 8),
                  child: DottedBorder(
                    color: Colors.black,
                    radius: Radius.circular(10),borderType: BorderType.Rect,
                    child: Container(
                      height: size.height*(0.058),
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5)),
                      alignment: Alignment.center,

                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Tap to Copy"),
                ],
              ),


              Text("Benefits",style:GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: size.height*(0.02)
              ) ),




            ],
          ),
        ),
      ),
    );
  }

  Future<void> share(data) async {
    // await FlutterShare.share(
    //     title: 'LedoCity',
    //     text: "Download our app from https://ledocity.com and use my refCode  ${data.toString()}",
    //     chooserTitle: 'Choose Share Method'
    // );
  }
}
