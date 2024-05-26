import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hullu/Screens/Game/game_list_screen.dart';
import 'package:hullu/Screens/Home/home_provider.dart';


class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(
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

          SizedBox(height: size.height*0.01),

          ref.watch(homeProvider).categoryLoading?CircularProgressIndicator():
          Expanded(
            child: ListView.builder(
              itemCount: ref.read(homeProvider).categoryModel.data!.length,

                padding: EdgeInsets.all(8),
                itemBuilder: (context,index){
                var item=ref.read(homeProvider).categoryModel.data![index];
               return Padding(
                 padding: const EdgeInsets.only(bottom: 8.0),
                 child: InkWell(
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (c)=>GameListScreen(gameData: item,))),
                   child: Container(
                    height: size.height*0.24,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade300
                    ),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(top: 8,left: 8,right: 8,bottom: 1),
                           child: Container(
                             width: size.width,
                             height: size.height*0.2,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(8),
                               image: DecorationImage(
                                 fit: BoxFit.fill,
                                 image: NetworkImage(item.categoryImage.toString())
                               )
                             ),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left:8.0),
                           child: Text("${item.categoryTitle}",
                            style: GoogleFonts.macondo(
                              fontWeight: FontWeight.bold

                            ),),
                         )
                       ],
                     ),
              ),
                 ),
               );
            }),
          ),
        ],
      ),
    );
  }
}
