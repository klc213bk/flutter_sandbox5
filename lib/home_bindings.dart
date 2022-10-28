import 'package:get/get.dart';

import 'controller/new_scan_2_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewScan2Controller>(() => NewScan2Controller());
  }
}
