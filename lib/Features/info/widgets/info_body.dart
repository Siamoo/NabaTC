import 'package:firebase1/Features/info/widgets/info_item_listview.dart';
import 'package:firebase1/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoBody extends StatelessWidget {
  const InfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    // String infoName = ' wjklsfhaKLRF FLAJKWHSJ FJKAS';
    // String infoDescrip =
    //     'You should now be able to start the Android emulator without any issues. If you run into anything else with Flutter, emulators, or setup  feel free to ask.';
    // Widget infoImage = const CustomInfoImage();
    double screenWidth = MediaQuery.of(context).size.width * .5;
    return Scaffold(
      appBar: AppBar(
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Info",
                style: GoogleFonts.bangers(
                  textStyle: const TextStyle(
                    fontSize: 28,
                    fontWeight:FontWeight.w500,
                    color: kOrangeColor
                  )
                ),),
          ],
        ),
        iconTheme: const IconThemeData(
          color: kOrangeColor
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20,),
                Text("Steps To Save Plants",
                style: GoogleFonts.bangers(
                  textStyle: const TextStyle(
                    fontSize: 28,
                    fontWeight:FontWeight.w500,
                    color: kYellowColor
                  )
                ),),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: InfoItemListview(screenWidth: screenWidth)
          )
        ]),
      ),
    );
  }
}
