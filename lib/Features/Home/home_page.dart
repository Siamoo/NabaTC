
import 'package:firebase1/Features/Note/presntation/views/note_page.dart';
import 'package:firebase1/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        actions: [IconButton(onPressed: (){
        // FirebaseAuth.instance.signOut();
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const NotePage(),
          ),
        );
        
      }, icon: const  Icon( Icons.logout, color: kOrangeColor))],),
      body:const SafeArea(
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // NoteLogo(screenWidth: screenWidth),
                // const NoteTextLogo(),
                // const SizedBox(
                //   height: 30,
                // ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            // child: BlocBuilder<NotesCubit, NotesState>(
            //   builder: (context, state) {
            //     List<Model> notes =
            //   BlocProvider.of<NotesCubit>(context).notes ?? [];
            //     return NoteListView(notes: notes, screenWidth: screenWidth);
            //   },
            // ),
          )
        ]),
      ),
    );
  }
}

