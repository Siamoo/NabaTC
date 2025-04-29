import 'package:firebase1/Features/Home/home_page.dart';
import 'package:firebase1/Features/Note/data/models/model.dart';
import 'package:firebase1/Features/Note/presntation/manger/notes_cubit/notes_cubit.dart';
import 'package:firebase1/Features/Note/presntation/views/widgets/add_note_fab.dart';
import 'package:firebase1/Features/Note/presntation/views/widgets/note_list_view.dart';
import 'package:firebase1/Features/Note/presntation/views/widgets/note_logo.dart';
import 'package:firebase1/Features/Note/presntation/views/widgets/note_text_logo.dart';
import 'package:firebase1/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class NoteBody extends StatelessWidget {
  const NoteBody({super.key, });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        actions: [IconButton(onPressed: (){
        FirebaseAuth.instance.signOut();
        // Navigator.pushReplacementNamed(context, 'HomePage');
        
      }, icon: const  Icon( Icons.logout, color: kOrangeColor))],),
      floatingActionButton: AddNoteFAB(screenWidth: screenWidth),
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NoteLogo(screenWidth: screenWidth),
                const NoteTextLogo(),
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
                return NoteListView(notes: notes, screenWidth: screenWidth);
              },
            ),
          )
        ]),
      ),
    );
  }
}
