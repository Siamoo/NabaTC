import 'package:firebase1/Features/Home/widgets/home_main_icons_button.dart';
import 'package:firebase1/Features/Home/widgets/home_plant_disease_listview.dart';
import 'package:firebase1/Features/Home/widgets/home_search_button.dart';
import 'package:firebase1/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * .5;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * .055),
          child: CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('SearchPage');
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: HomeSearchButton(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "    let's fun . .",
                    style: GoogleFonts.bangers(
                        textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: kOrangeColor)),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  HomeMainIconsButton(),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    " Famous tomato diseases",
                    style: GoogleFonts.bangers(
                      textStyle: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: kOrangeColor),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: HomePlantDiseaseListView(screenWidth: screenWidth),
            )
          ]),
        ),
      ),
    );
  }
}
