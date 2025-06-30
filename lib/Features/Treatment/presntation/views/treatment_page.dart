import 'dart:io';

import 'package:firebase1/Features/Treatment/presntation/views/widgets/treatment_body.dart';
import 'package:flutter/material.dart';


class TreatmentPage extends StatelessWidget {
final String diseaseName;
final File? image;
  const TreatmentPage( {super.key, required this.diseaseName, this.image});

  @override
  Widget build(BuildContext context) {
    

    return  TreatmentBody(diseaseName: diseaseName, image: image, );
  }
}