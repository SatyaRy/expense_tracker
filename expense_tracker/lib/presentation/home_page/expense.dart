import 'package:cached_network_svg_image/cached_network_svg_image.dart';

import 'package:flutter/material.dart';

class Expense extends StatelessWidget {
  const Expense({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff2f2f2),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            children: [
              appBar(),
              const SizedBox(
                height: 35,
              ),
              const ExpenseGraph()
            ],
          ),
        ));
  }


  Widget appBar() {
    const logo =
        "https://res.cloudinary.com/dnydodget/image/upload/v1735102416/jojo_oflwuc.svg";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Back!",
              style: TextStyle(
                  fontSize: 22,
                  color: Color(0xff010b13),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Username",
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff010b13),
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        Container(
          width: 65,
          height: 65,
          decoration: const BoxDecoration(
              color: Color(0xff57C84D), shape: BoxShape.circle),
          child: Center(
            child: CachedNetworkSVGImage(
              logo,
              width: 40,
              height: 40,
            ),
          ),
        ),
      ],
    );
  }
}

class ExpenseGraph extends StatelessWidget {
  const ExpenseGraph({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return Container(
      width: width,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.grey, offset: Offset(0, 1))
          ],
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
