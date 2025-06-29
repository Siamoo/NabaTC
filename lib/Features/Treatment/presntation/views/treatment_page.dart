import 'package:firebase1/Features/Treatment/presntation/views/widgets/treatment_body.dart';
import 'package:flutter/material.dart';


class TreatmentPage extends StatelessWidget {
final String diseaseName;
  const TreatmentPage( {super.key, required this.diseaseName});

  @override
  Widget build(BuildContext context) {
    

    return  TreatmentBody(diseaseName: diseaseName );
  }
}