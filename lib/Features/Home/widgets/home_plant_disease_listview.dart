
import 'package:firebase1/Features/Home/widgets/home_plant_disease_item.dart';
import 'package:firebase1/Features/Home/widgets/list_of_home_plant_disease.dart';
import 'package:flutter/material.dart';

class HomePlantDiseaseListView extends StatelessWidget {
  const HomePlantDiseaseListView({
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
      itemCount: homeList.length,
      itemBuilder: (context, index) {
        final item = homeList[index];
        return HomePlantDiseaseItem(screenWidth: screenWidth, name:item.name , description: item.description, customHomePlantImage: item.customHomePlantImage,);
      },
    );
  }
}
