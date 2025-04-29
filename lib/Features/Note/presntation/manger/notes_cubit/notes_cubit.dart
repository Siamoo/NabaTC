

import 'package:bloc/bloc.dart';
import 'package:firebase1/Features/Note/data/models/model.dart';
import 'package:firebase1/constant.dart';
import 'package:hive/hive.dart';

import 'package:meta/meta.dart';


part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<Model>? notes;
  fetchAllNotes() {
      var notesBox = Hive.box<Model>(kModelBox);
    notes = notesBox.values.toList();
    emit(NotesSaccess());
  }
}
