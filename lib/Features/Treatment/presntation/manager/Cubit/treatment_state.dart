part of 'treatment_cubit.dart';

abstract class TreatmentState {}

class TreatmentInitial extends TreatmentState {}

class TreatmentLoading extends TreatmentState {}

class TreatmentLoaded extends TreatmentState {
  final TreatmentModel treatment;
  TreatmentLoaded(this.treatment);
}

class TreatmentError extends TreatmentState {
  final String message;
  TreatmentError(this.message);
}
