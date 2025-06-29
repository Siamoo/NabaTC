import 'package:firebase1/Features/Note/data/models/model.dart';
import 'package:firebase1/Features/Note/presntation/manger/notes_cubit/notes_cubit.dart';
import 'package:firebase1/Features/Note/presntation/views/widgets/add_note_fab.dart';
import 'package:firebase1/Features/Note/presntation/views/widgets/note_list_view.dart';
import 'package:firebase1/Features/Note/presntation/views/widgets/note_logo.dart';
import 'package:firebase1/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteBody extends StatelessWidget {
  const NoteBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Note",
              style: GoogleFonts.bangers(
                textStyle: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: kOrangeColor),
              ),
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: kOrangeColor),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      floatingActionButton: AddNoteFAB(screenWidth: screenWidth),
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: NoteLogo(screenWidth: screenWidth),
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<NotesCubit, NotesState>(
              builder: (context, state) {
                List<Model> notes =
                    BlocProvider.of<NotesCubit>(context).notes ?? [];
                return NoteListView(notes: notes, screenWidth: screenWidth);
              },
            ),
          )
        ]),
      ),
    );
  }
}
