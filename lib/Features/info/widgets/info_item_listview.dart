import 'package:firebase1/Features/info/widgets/info_item.dart';
import 'package:firebase1/Features/info/widgets/list_of_info_item.dart';
import 'package:flutter/material.dart';

class InfoItemListview extends StatelessWidget {
  const InfoItemListview({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.zero,
  itemCount: infoList.length,
  itemBuilder: (context, index) {
    final item = infoList[index];
    return InfoItem(
      infoImage: item.customInfoImage,
      screenWidth: screenWidth,
      infoName: item.name,
      infoDescrip: item.description,
    );
  },
    );
  }
}

