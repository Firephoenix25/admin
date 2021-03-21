import 'package:get/get.dart';
import 'package:meta/meta.dart';

class AllLeadsController extends GetxController {
  int i;

  void setI(int value) => i = value;
  int getI() => i;

  void increment() => i++;
}
