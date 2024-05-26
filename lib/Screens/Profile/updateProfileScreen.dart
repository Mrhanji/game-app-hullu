import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';


class UpdateProfileScreen extends ConsumerWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(

        elevation: 0,
        leading: IconButton(icon: Icon(CupertinoIcons.left_chevron,color: Colors.white,),
          onPressed: ()=>Navigator.pop(context),),
        centerTitle: true,
        title: Text("Update Profile",
            style:GoogleFonts.poppins(fontWeight: FontWeight.w500,color: Colors.white) ),
      ),


      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 10,right: 10),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [




          SizedBox(
            height: size.height*(0.02),
          ),
          Text("Full Name",style:GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 8),
              height: size.height*(0.065),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade400)),
              child: TextField(
                autocorrect: false,
                //controller: ref.read(RegisterProvider).fullName,
                decoration: InputDecoration(
                    hintText: "Your Full Name",
                    border: InputBorder.none,
                    hintStyle: GoogleFonts.roboto()),
                keyboardType: TextInputType.text,
              )),

            SizedBox(
              height: size.height*(0.02),
            ),
            Text("Email Address",style:GoogleFonts.poppins(fontWeight: FontWeight.w600)),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 8),
                height: size.height*(0.065),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade400)),
                child: TextField(
                  autocorrect: false,
                  //controller: ref.read(RegisterProvider).email,
                  decoration: InputDecoration(
                      hintText: "abc@xyz",
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.roboto()),
                  keyboardType: TextInputType.emailAddress,
                )),


            SizedBox(
              height: size.height*(0.02),
            ),
            Text("Phone Number",style:GoogleFonts.poppins(fontWeight: FontWeight.w600)),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 8),
                height: size.height*(0.065),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade400)),
                child: TextField(
                  autocorrect: false,
                  
                  decoration: InputDecoration(
                      hintText: "987XXXXXXX",
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.roboto()),
                  keyboardType: TextInputType.number,
                )),

            SizedBox(
              height: size.height*(0.02),
            ),

            Text("Password",style:GoogleFonts.poppins(fontWeight: FontWeight.w600)),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 8),
                height: size.height*(0.065),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade400)),
                child: TextField(
                  autocorrect: false,
               
                  decoration: InputDecoration(
                      hintText: "********",
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.roboto()),
                  keyboardType: TextInputType.text,
                )),
            SizedBox(
              height: size.height*(0.02),
            ),

       ],),
      ),
    );
  }
}