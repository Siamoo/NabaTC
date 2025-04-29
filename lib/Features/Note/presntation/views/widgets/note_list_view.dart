
import 'package:firebase1/Features/Note/data/models/model.dart';
import 'package:firebase1/Features/Note/presntation/views/widgets/note_list_view_item.dart';
import 'package:flutter/material.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({
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
          child: NoteListViewItem(
            screenWidth: screenWidth, note: notes[index],
          ),
        );
      },
    );
  }
}
