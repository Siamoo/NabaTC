import 'package:firebase1/Features/info/widgets/info_item_listview.dart';
import 'package:firebase1/Features/info/widgets/info_title.dart';
import 'package:firebase1/core/utils/constant/constant.dart';
import 'package:firebase1/core/utils/custom_app_bar_title.dart';
import 'package:flutter/material.dart';

class InfoBody extends StatelessWidget {
  const InfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * .5;
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBarTitle(pageTilte: 'Info'),
        iconTheme: const IconThemeData(color: kOrangeColor),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: InfoTitle(),
          ),
          SliverToBoxAdapter(child: InfoItemListview(screenWidth: screenWidth))
        ]),
      ),
    );
  }
}
