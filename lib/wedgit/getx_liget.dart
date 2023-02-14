
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../main.dart';

import '../main.dart';
import 'classhistory.dart';

class RxController_type extends GetxController{
  // var box=Hive.box<History>(Hist);
 var list=<History>[].obs;
  Clean()=> list.clear();



}