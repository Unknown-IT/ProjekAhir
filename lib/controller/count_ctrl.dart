import 'package:get/get.dart';

final _counter = 1.obs;

class CounterController extends GetxController {
  int get counter => _counter.value;
  void increment() => _counter.value++;
}

class CounterController2 extends GetxController {
  int get counter => _counter.value;
  void increment() => _counter.value--;
}
