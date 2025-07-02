import 'dart:io';
import 'package:firebase1/Features/Treatment/presntation/views/widgets/case_one_list_view.dart';
import 'package:firebase1/Features/Treatment/presntation/views/widgets/case_two_list_view.dart';
import 'package:firebase1/custom_app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:firebase1/Features/History/data/models/historymodel.dart';
import 'package:firebase1/Features/Treatment/presntation/manager/Cubit/treatment_cubit.dart';
import 'package:firebase1/constant.dart';

class TreatmentBody extends StatefulWidget {
  final String diseaseName;
  final File? image;
  final Historymodel? historyModel; // <-- NEW

  const TreatmentBody({
    super.key,
    required this.diseaseName,
    this.image,
    this.historyModel,
  });

  @override
  State<TreatmentBody> createState() => _TreatmentBodyState();
}

class _TreatmentBodyState extends State<TreatmentBody> {
  bool _isSavedToHistory = false;

  void _saveToHistory(Historymodel model) {
    final box = Hive.box<Historymodel>('historyBox');

    final alreadyExists = box.values.any((element) =>
        element.name == model.name &&
        element.date.day == model.date.day &&
        element.date.month == model.date.month &&
        element.date.year == model.date.year);

    if (!alreadyExists) {
      box.add(model);
      setState(() {
        _isSavedToHistory = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Case 1: Display from history
    if (widget.historyModel != null) {
      final model = widget.historyModel!;
      return Scaffold(
        appBar:AppBar(
          title: CustomAppBarTitle(pageTilte: 'Disease Info'),
          iconTheme: const IconThemeData(color: kOrangeColor),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CaseOneListView(widget: widget, model: model),
        ),
      );
    }

    // Case 2: Fetch and display treatment from cubit
    return BlocProvider(
      create: (_) => TreatmentCubit()..fetchTreatment(widget.diseaseName),
      child: Scaffold(
        appBar: AppBar(
          title: CustomAppBarTitle(pageTilte: 'Disease Info'),
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

              if (!_isSavedToHistory) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  final historyModel = Historymodel(
                    name: treatMent.name,
                    description: treatMent.description,
                    occurrence: treatMent.occurrence,
                    causes: treatMent.causes,
                    treatment: treatMent.treatment,
                    date: DateTime.now(),
                  );
                  _saveToHistory(historyModel);
                });
              }
              return CaseTwoListView(widget: widget, treatMent: treatMent);
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
