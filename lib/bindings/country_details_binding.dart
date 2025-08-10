import 'package:eskalate_project/controllers/country_details_controller.dart';
import 'package:get/get.dart';

class CountryDetailsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CountryDetailsController>(() => CountryDetailsController());
  }
}
