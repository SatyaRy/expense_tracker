import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color(0xfff2f2f2),
        body: SafeArea(
            child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "List of expenses",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Slidable(
              endActionPane: ActionPane
              (motion: const BehindMotion(), 
              children: [
                GestureDetector(
                  onTap:(){

                  },
                  child: Container(
                    width: width*0.4,
                    height: 90,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10))
                    ),
                    child: const Center(
                      child: Icon(Icons.delete,size: 30,color: Colors.white,),
                    ),
                  ),
                )
                  
              ]),
              child:  Container(
              padding: const EdgeInsets.only(left: 5,right: 16),
              width: width,
              height: 90,
              decoration: BoxDecoration(
                  boxShadow:const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 1)
                    )
                  ],
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CachedNetworkSVGImage("https://res.cloudinary.com/dnydodget/image/upload/v1737551682/voucher_sslpz2.svg"),
               const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Health",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),),
                    Text("No noted",style: TextStyle(
                      fontSize: 16
                    ),)
                  ],
                )
                  ],
                ),
                const Row(
                  children: [
                    Text("-1000\$",style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                      
                    ),)
                  ],
                )
              ],
             ),
            )
            )
          ],
        )));
  }
}
