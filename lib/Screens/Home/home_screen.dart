
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '/Screens/Home/home_provider.dart';
import '/Screens/Home/product_screen.dart';
import '/Utils/app_config.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
         child: Container(
           width: size.width,
           child: Column(
            children: [
              Row(
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

              SizedBox(height: size.height*0.01),
              Container(
                height: size.height*0.2,
                 width: size.width,
                 child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage("https://shreebalajijewellers.in/images/B-Web03.jpg"),
                        fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(6)
                      ),
                      
                    );
                  },autoplayDelay: 1,
                  itemCount: 3,
                   autoplay: true,
                   duration: 2,
                  viewportFraction: 0.9,
                  scale: 0.9,
                ),
              ),
              SizedBox(height: size.height*0.01),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: ref.read(homeProvider).productData.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: size.height*0.01,
                    mainAxisSpacing: size.height*0.01,
                    childAspectRatio: (size.height/size.width)*0.4
                  ),
                  itemBuilder: (context,index){
                    var item=ref.read(homeProvider).productData[index];
                    return InkWell(
                       onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (builder)=>ProductView(items: item,))),
                      child: Container(
                        height: size.height*0.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey.shade200
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Hero(
                              tag: '${item.productId}',
                              child: Container(
                                height:size.height*0.19,
                                  width: size.width,
                                  child: Image.network("${item.productImage}",fit: BoxFit.fill,)),
                            ),
                            SizedBox(height: 10,),
                           Padding(
                             padding: const EdgeInsets.all(4.0),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("${item.productTitle}",
                                   style: GoogleFonts.macondo(fontWeight: FontWeight.bold),
                                 maxLines: 1,overflow: TextOverflow.ellipsis,),
                                 Text("${AppConfig.appCurrency}${item.price}",
                                   style: GoogleFonts.macondo(fontWeight: FontWeight.w400),),
                               ],
                             ),
                           )
                          ],
                        ),

                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: size.height*0.01),

            ],
        ),
         ),
      ),
    );
  }
}
