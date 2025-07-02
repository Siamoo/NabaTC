
import 'package:firebase1/Features/Treatment/data/models/treatment_model.dart';
import 'package:firebase1/Features/Treatment/presntation/views/widgets/custom_description.dart';
import 'package:firebase1/Features/Treatment/presntation/views/widgets/custom_plant_image.dart';
import 'package:firebase1/Features/Treatment/presntation/views/widgets/custom_treatment_image.dart';
import 'package:firebase1/Features/Treatment/presntation/views/widgets/treatment_body.dart';
import 'package:flutter/material.dart';

class CaseTwoListView extends StatelessWidget {
  const CaseTwoListView({
    super.key,
    required this.widget,
    required this.treatMent,
  });

  final TreatmentBody widget;
  final TreatmentModel treatMent;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.image != null)
                CustomPlantImage(
                  image: widget.image,
                  name: treatMent.name,
                )
              else
                CustomTreatmentImage(name: treatMent.name),
              const SizedBox(height: 16),
              CustomDescription(
                title: 'Description',
                decoration: treatMent.description,
              ),
              const SizedBox(height: 16),
              CustomDescription(
                title: 'Occurrence',
                decoration: treatMent.occurrence,
              ),
              const SizedBox(height: 16),
              CustomDescription(
                title: 'Causes',
                decoration: treatMent.causes,
              ),
              const SizedBox(height: 16),
              CustomDescription(
                title: 'Treatment',
                decoration: treatMent.treatment,
              ),
              
            ],
          ),
        ),
      ],
    );
  }
}
