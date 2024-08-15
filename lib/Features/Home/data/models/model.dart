import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class Model extends HiveObject {
  @HiveField(0)
  String titel;
  @HiveField(1)
  String firstObj;
  @HiveField(2)
    String secondObj;


  Model(
      {required this.titel,
      required this.firstObj,
      required this.secondObj});
}
