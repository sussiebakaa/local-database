import 'package:flutter_data/pages/create/controller.dart';
import 'package:get/get.dart';

class CreateBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateController());
  }
}
