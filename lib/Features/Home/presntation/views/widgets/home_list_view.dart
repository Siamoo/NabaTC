
import 'package:firebase1/Features/Home/data/models/model.dart';
import 'package:firebase1/Features/Home/presntation/views/widgets/home_list_view_item.dart';
import 'package:flutter/material.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({
    super.key,
    required this.notes,
    required this.screenWidth,
  });

  final List<Model> notes;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: notes.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: HomeListViewItem(
            screenWidth: screenWidth, note: notes[index],
          ),
        );
      },
    );
  }
}
