import 'package:firebase1/Features/Note/data/models/model.dart';
import 'package:firebase1/Features/Note/presntation/manger/add_note_cubit/add_note_cubit.dart';
import 'package:firebase1/Features/Note/presntation/manger/notes_cubit/notes_cubit.dart';
import 'package:firebase1/core/utils/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NoteBottomSheetScreen extends StatelessWidget {
   const NoteBottomSheetScreen({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
       String? titel ,fristAdvice , secondAdvice ;


    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: screenWidth * .2,
              height: screenWidth * .2,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('asset/images/bottom_sheet.jpg'),
                  fit: BoxFit.fill,
                ),
                border: Border.all(
                  color: const Color(0xff4aba8f),
                  width: 3, // Border width
                ),
                borderRadius:
                    BorderRadius.circular(40), // Optional: adds rounded corners
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Add Note',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff4aba8f)),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    onSaved: (newValue) {
                titel = newValue;
              },
                    decoration: const InputDecoration(
                      hintText: 'Titel',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kBottomSheetColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kBottomSheetColor),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'plese enter title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    onSaved: (newValue) {
                fristAdvice = newValue;
              },
                    decoration: const InputDecoration(
                      hintText: 'First advice',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kBottomSheetColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kBottomSheetColor),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'plese enter advice';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    onSaved: (newValue) {
                secondAdvice = newValue;
              },
                    decoration:const InputDecoration(
                      hintText: 'Second advice',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kBottomSheetColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kBottomSheetColor),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'plese enter advice';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  Builder(
                    builder: (context) {
                      return BlocBuilder<AddNoteCubit, AddNoteState>(
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed: () {
                              if (Form.of(context).validate()) {
                                Form.of(context).save();
                                Model note =Model(titel: titel!, firstObj: fristAdvice!, secondObj: secondAdvice!, );
                                BlocProvider.of<AddNoteCubit>(context).addNote(note);
                                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                                ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(
                                      content: Text('Note add, $titel')),
                                );
                              }
                            },
                            child: const Text(
                              'Submit',
                              style: TextStyle(color: Color(0xff4aba8f)),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
