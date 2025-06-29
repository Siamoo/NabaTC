class TreatmentModel {
  final String name;
  final String description;
  final String occurrence;
  final String causes;
  final String treatment;

  TreatmentModel({
    required this.name,
    required this.description,
    required this.occurrence,
    required this.causes,
    required this.treatment,
  });

  factory TreatmentModel.fromJson(Map<String, dynamic> json) {
    return TreatmentModel(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      occurrence: json['occurrence'] ?? '',
      causes: json['causes'] ?? '',
      treatment: json['treatment'] ?? '',
    );
  }
}
