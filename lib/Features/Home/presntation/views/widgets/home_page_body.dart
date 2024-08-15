import 'dart:developer';

import 'package:firebase1/Features/Home/data/models/model.dart';
import 'package:firebase1/Features/Home/presntation/manger/add_note_cubit/add_note_cubit.dart';
import 'package:firebase1/Features/Home/presntation/manger/notes_cubit/notes_cubit.dart';
import 'package:firebase1/Features/Home/presntation/views/widgets/bottom_sheet_screen.dart';
import 'package:firebase1/Features/Home/presntation/views/widgets/home_list_view.dart';
import 'package:firebase1/Features/Home/presntation/views/widgets/home_logo.dart';
import 'package:firebase1/Features/Home/presntation/views/widgets/home_text_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key, });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        foregroundColor: Colors.black,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: BlocConsumer<AddNoteCubit, AddNoteState>(
                  listener: (context, state) {
                    if (state is AddNoteSuccess) {
                      Navigator.pop(context);
                    } else if (state is AddNoteFailure) {
                      log('error : ${state.errMessage}');
                    }
                  },
                  builder: (BuildContext context, AddNoteState state) {
                    return BottomSheetScreen(screenWidth: screenWidth);
                  },
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HomeLogo(screenWidth: screenWidth),
                const HomeTextLogo(),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<NotesCubit, NotesState>(
              builder: (context, state) {
                List<Model> notes =
              BlocProvider.of<NotesCubit>(context).notes ?? [];
                return HomeListView(notes: notes, screenWidth: screenWidth);
              },
            ),
          )
        ]),
      ),
    );
  }
}
