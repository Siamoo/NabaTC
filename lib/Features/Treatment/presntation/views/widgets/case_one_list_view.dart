
import 'package:firebase1/Features/History/data/models/historymodel.dart';
import 'package:firebase1/Features/Treatment/presntation/views/widgets/custom_description.dart';
import 'package:firebase1/Features/Treatment/presntation/views/widgets/custom_plant_image.dart';
import 'package:firebase1/Features/Treatment/presntation/views/widgets/custom_treatment_image.dart';
import 'package:firebase1/Features/Treatment/presntation/views/widgets/treatment_body.dart';
import 'package:flutter/material.dart';

class CaseOneListView extends StatelessWidget {
  const CaseOneListView({
    super.key,
    required this.widget,
    required this.model,
  });

  final TreatmentBody widget;
  final Historymodel model;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        if (widget.image != null)
          CustomPlantImage(image: widget.image, name: model.name)
        else
          CustomTreatmentImage(name: model.name),
        const SizedBox(height: 16),
        CustomDescription(
            title: 'Description', decoration: model.description),
        const SizedBox(height: 16),
        CustomDescription(
            title: 'Occurrence', decoration: model.occurrence),
        const SizedBox(height: 16),
        CustomDescription(title: 'Causes', decoration: model.causes),
        const SizedBox(height: 16),
        CustomDescription(
            title: 'Treatment', decoration: model.treatment),
      ],
    );
  }
}
