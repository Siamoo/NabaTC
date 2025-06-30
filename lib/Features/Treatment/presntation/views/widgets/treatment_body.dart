import 'dart:io';

import 'package:firebase1/Features/Treatment/presntation/manager/Cubit/treatment_cubit.dart';
import 'package:firebase1/Features/Treatment/presntation/views/widgets/custom_description.dart';
import 'package:firebase1/Features/Treatment/presntation/views/widgets/custom_plant_image.dart';
import 'package:firebase1/Features/Treatment/presntation/views/widgets/custom_treatment_image.dart';
import 'package:firebase1/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class TreatmentBody extends StatelessWidget {
  final String diseaseName;
  final File? image;

  const TreatmentBody({super.key, required this.diseaseName, this.image});

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
                "More info",
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
              final treatMent = state.treatment;
              return CustomScrollView(
                slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (image != null)
                              CustomPlantImage(
                                image: image, name: treatMent.name,
                              )
                            else 
                            CustomTreatmentImage(name: treatMent.name),
                            SizedBox(
                              height: 16,
                            ),
                            CustomDescription(title: 'Description', decoration: treatMent.description,),
                            SizedBox(
                              height: 16,
                            ),
                            CustomDescription(title: 'Occurrence', decoration: treatMent.occurrence,),
                            SizedBox(
                              height: 16,
                            ),
                            CustomDescription(title: 'Causes', decoration: treatMent.causes,),
                            SizedBox(
                              height: 16,
                            ),
                            CustomDescription(title: 'Treatment', decoration: treatMent.treatment,),
                                        
                          ],
                        )),
                      ),
                    ],
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
