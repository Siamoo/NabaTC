import 'package:bloc/bloc.dart';
import 'package:firebase1/Features/Note/data/models/model.dart';
import 'package:firebase1/constant.dart';
import 'package:hive/hive.dart';

import 'package:meta/meta.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

    addNote(Model note) async {
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<Model>(kModelBox);
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
