import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class BankAccountScreen extends ConsumerWidget {
  const BankAccountScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Add Account'),
                  content: Container(
                    height: size.height*(0.4),
                    width: size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextField(
                            //controller: ref.read(withdrawProvider).bankName,
                            decoration: InputDecoration(
                              hintText: "Bank Name"
                            ),
                          ),
                          SizedBox(height: 5,),
                          TextField(
                            //controller: ref.read(withdrawProvider).bankNumber,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "Account Number"
                            ),
                          ),
                          SizedBox(height: 5,),
                          TextField(
                            maxLength: 11,
                            //controller: ref.read(withdrawProvider).ifscCode,
                            decoration: InputDecoration(
                                hintText: "IFSC Code"
                            ),
                          ),
                          SizedBox(height: 5,),
                          TextField(
                          //  controller: ref.read(withdrawProvider).upiId,
                            decoration: InputDecoration(
                                hintText: "UPI Id"
                            ),
                          ),
                          SizedBox(height: 5,),
                        ],
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false); // No button
                      },
                      child: Text('No',style: GoogleFonts.poppins(color: Colors.red),),
                    ),
                    TextButton(
                      onPressed: () {
                        //ref.read(withdrawProvider).addBank();// Yes button
                      },
                      child: Text('Yes'),
                    ),
                  ],
                );
              },
            );
          }, icon: Icon(CupertinoIcons.add))
        ],
        //backgroundColor: HexColor("5f259e"),
        elevation: 0,
        leading: IconButton(icon: Icon(CupertinoIcons.left_chevron,color: Colors.white,),
          onPressed: ()=>Navigator.pop(context),),
        centerTitle: true,
        title: Text("Bank Accounts",
           style: GoogleFonts.poppins(fontWeight: FontWeight.w500,color: Colors.white) ),
      ),
      body: ListView.builder(
        itemCount: 0,
        itemBuilder: (context,index){
         /// var data=ref.read(withdrawProvider).banksModel.data![index];
      var data;
          return ListTile(
            title: Text("${data.bankName}:- ${data.ifscCode} "),
            subtitle: Text("${data.accountNumber}"),
            trailing: IconButton(onPressed: (){
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Alert'),
                    content: Text("Are you Sure?"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false); // No button
                        },
                        child: Text('No',style: GoogleFonts.poppins(color: Colors.red),),
                      ),
                      TextButton(
                        onPressed: () {
                         // ref.read(withdrawProvider).deleteBankAccount(data.bId);// Yes button
                        },
                        child: Text('Yes'),
                      ),
                    ],
                  );
                },
              );
            }, icon: Icon(CupertinoIcons.delete)),
          );
        },
      ),
    );
  }
}
