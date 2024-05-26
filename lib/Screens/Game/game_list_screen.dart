import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hullu/Screens/Game/game_screen.dart';
import '/Screens/Game/game_list_provider.dart';
import '../../Repo/Category/CategoryModel.dart';


class GameListScreen extends ConsumerWidget {
  CategoryData gameData;
   GameListScreen({super.key,required this.gameData});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    ref.read(gameListProvider).onInit(gameData.categoryId);
    Size size=MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("${gameData.categoryTitle}"),
        centerTitle: true,
        ),
      body: ref.watch(gameListProvider).gameLoading?Center(child: CircularProgressIndicator()):

ref.read(gameListProvider).gameListResponse.data!.length!=0?
      (GridView.builder(
        itemCount: ref.read(gameListProvider).gameListResponse.data!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: (size.height/size.width)*0.4
        ),
        itemBuilder: (context,index){
          var data=ref.read(gameListProvider).gameListResponse.data![index];
      return Padding(
        padding: const EdgeInsets.only(left: 5.0,right: 5,top: 5),
         child: InkWell(
           onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (c)=>GameScreen(data: data,))),
           child: Container(
             height: size.height*0.1,
             width: size.width*0.1,
           decoration: BoxDecoration(
             color: Colors.grey.shade200,
             borderRadius: BorderRadius.circular(5),
           ),

             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Container(
                   height: size.height*0.27,
                   width: size.width*0.5,
                   decoration: BoxDecoration(
                       image: DecorationImage(
                           fit: BoxFit.fill,
                           image: NetworkImage(
                               "https://play-lh.googleusercontent.com/R2ypJNpZ_8yQWIaE3zjidm74PEN9_iJMCBIh-aM71-5X9zmlKQN6n-OTPjzGJcL-7Jsd"
                           )
                       )
                   ),
                 ),

                 Row(
                   children: [
                     SizedBox(width: 10,),
                     Text("${data.gameTitle}",style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
                   ],
                 )
               ],
             ),
           ),
         )



      );
        },
      )):Center(child: Text("No Games Found!",style: GoogleFonts.poppins(
  color: Colors.black,
  fontWeight: FontWeight.bold
),),),
    );
  }
}
