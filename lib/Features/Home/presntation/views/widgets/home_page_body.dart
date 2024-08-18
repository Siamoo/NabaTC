import 'package:firebase1/Features/Home/data/models/model.dart';
import 'package:firebase1/Features/Home/presntation/manger/notes_cubit/notes_cubit.dart';
import 'package:firebase1/Features/Home/presntation/views/widgets/add_note_fab.dart';
import 'package:firebase1/Features/Home/presntation/views/widgets/home_list_view.dart';
import 'package:firebase1/Features/Home/presntation/views/widgets/home_logo.dart';
import 'package:firebase1/Features/Home/presntation/views/widgets/home_text_logo.dart';
import 'package:firebase1/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key, });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(actions: [IconButton(onPressed: (){
        FirebaseAuth.instance.signOut();
        Navigator.pushReplacementNamed(context, 'LoginPage');
      }, icon: const  Icon( Icons.logout, color: kOrangeColor))],),
      floatingActionButton: AddNoteFAB(screenWidth: screenWidth),
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
