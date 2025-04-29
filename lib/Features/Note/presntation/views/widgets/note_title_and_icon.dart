
import 'package:firebase1/Features/Note/data/models/model.dart';
import 'package:firebase1/Features/Note/presntation/manger/notes_cubit/notes_cubit.dart';
import 'package:firebase1/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteTitleAndIcon extends StatelessWidget {
  const NoteTitleAndIcon({
    super.key,
    required this.note,
  });

  final Model note;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          note.titel,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: kOrangeColor),
        ),
        IconButton(onPressed: (){
          note.delete();
          BlocProvider.of<NotesCubit>(context).fetchAllNotes();
        }, icon: const Icon(Icons.close),color:Colors.orangeAccent,),
        
      ],
    );
  }
}
