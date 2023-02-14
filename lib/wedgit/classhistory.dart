import 'package:hive/hive.dart';
part 'classhistory.g.dart';
@HiveType(typeId: 0)
class History extends HiveObject {

  @HiveField(0)
  late String result;
  @HiveField(1)
  late String operation;
  @HiveField(2)
  late DateTime dateTime;
  History(this.dateTime,this.result,this.operation);
}