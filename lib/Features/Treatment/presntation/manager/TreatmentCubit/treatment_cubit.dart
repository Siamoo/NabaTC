import 'package:firebase1/Features/Treatment/data/models/treatment_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

part 'treatment_state.dart';

class TreatmentCubit extends Cubit<TreatmentState> {
  TreatmentCubit() : super(TreatmentInitial());

  Future<void> fetchTreatment(String diseaseName) async {
    emit(TreatmentLoading());
    try {
      final response = await Dio().get(
        'https://c80d-156-207-169-184.ngrok-free.app/api/disease/$diseaseName',
      );
      if (response.data['success'] == true && response.data['disease'] != null) {
        final treatment = TreatmentModel.fromJson(response.data['disease']);
        emit(TreatmentLoaded(treatment));
      } else {
        emit(TreatmentError('No data found.'));
      }
    } catch (e) {
      emit(TreatmentError(e.toString()));
    }
  }
}
