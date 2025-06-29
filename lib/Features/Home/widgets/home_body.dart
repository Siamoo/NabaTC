import 'package:firebase1/Features/Ai/presentation/views/ai_page.dart';
import 'package:firebase1/Features/Ask/ask_page.dart';
import 'package:firebase1/Features/Home/widgets/custom_home_icons_item.dart';
import 'package:firebase1/Features/Home/widgets/home_plant_disease_listview.dart';
import 'package:firebase1/Features/Note/presntation/views/note_page.dart';
import 'package:firebase1/Features/info/info_page.dart';
import 'package:firebase1/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // String iconName = '';
    // Widget pageName = const LoginPage();
    // IconData iconData = Icons.abc;
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
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Icon(Icons.search, color: Colors.black54),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'search . . .',
                              style: TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "    let's fun . .",
                    style: GoogleFonts.bangers(
                        textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: kWhiteBlackColor)),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomHomeIconsItem(
                        iconName: Icons.psychology_sharp,
                        iconText: 'Ai',
                        pageName: AiPage(),
                        iconSize: 40,
                      ),
                      CustomHomeIconsItem(
                        iconName: Icons.group,
                        iconText: 'Ask',
                        pageName: AskPage(),
                        iconSize: 35,
                      ),
                      CustomHomeIconsItem(
                        iconName: Icons.edit,
                        iconText: 'Note',
                        pageName: NotePage(),
                        iconSize: 35,
                      ),
                      CustomHomeIconsItem(
                        iconName: Icons.priority_high_rounded,
                        iconText: 'Info',
                        pageName: InfoPage(),
                        iconSize: 35,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    " Famous tomato diseases",
                    style: GoogleFonts.bangers(
                        textStyle: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: kWhiteBlackColor)),
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
