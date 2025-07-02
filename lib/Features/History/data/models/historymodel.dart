import 'package:hive/hive.dart';

part 'historymodel.g.dart';   //the error will delete after generat 

@HiveType(typeId: 1)
class Historymodel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final String occurrence;

  @HiveField(3)
  final String causes;

  @HiveField(4)
  final String treatment;

  @HiveField(5)
  final DateTime date;

  Historymodel({
    required this.name,
    required this.description,
    required this.occurrence,
    required this.causes,
    required this.treatment,
    required this.date,
  });
}




