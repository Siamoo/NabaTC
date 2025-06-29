import 'package:firebase1/Features/Treatment/presntation/manager/TreatmentCubit/treatment_cubit.dart';
import 'package:firebase1/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class TreatmentBody extends StatelessWidget {
  final String diseaseName;

  const TreatmentBody({super.key, required this.diseaseName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TreatmentCubit()..fetchTreatment(diseaseName),
      child: Scaffold(
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
        body: BlocBuilder<TreatmentCubit, TreatmentState>(
          builder: (context, state) {
            if (state is TreatmentLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TreatmentLoaded) {
              final t = state.treatment;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    Text('Name: ${t.name}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Description: ${t.description}'),
                    const SizedBox(height: 8),
                    Text('Occurrence: ${t.occurrence}'),
                    const SizedBox(height: 8),
                    Text('Causes: ${t.causes}'),
                    const SizedBox(height: 8),
                    Text('Treatment: ${t.treatment}'),
                  ],
                ),
              );
            } else if (state is TreatmentError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const Center(child: Text('Search for a disease.'));
          },
        ),
      ),
    );
  }
}
