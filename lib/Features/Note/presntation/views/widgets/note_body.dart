import 'package:firebase1/Features/Note/data/models/model.dart';
import 'package:firebase1/Features/Note/presntation/manger/notes_cubit/notes_cubit.dart';
import 'package:firebase1/Features/Note/presntation/views/widgets/add_note_fab.dart';
import 'package:firebase1/Features/Note/presntation/views/widgets/note_list_view.dart';
import 'package:firebase1/Features/Note/presntation/views/widgets/note_logo.dart';
import 'package:firebase1/core/utils/constant/constant.dart';
import 'package:firebase1/core/utils/custom_app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteBody extends StatelessWidget {
  const NoteBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBarTitle(pageTilte: 'Note'),
        iconTheme: const IconThemeData(color: kOrangeColor),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      floatingActionButton: AddNoteFAB(screenWidth: screenWidth),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<NotesCubit, NotesState>(
            builder: (context, state) {
              List<Model> notes =
                  BlocProvider.of<NotesCubit>(context).notes ?? [];
              return Column(
                children: [
                  if (notes.isEmpty) NoteLogo(),
                  NoteListView(notes: notes, screenWidth: screenWidth),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
