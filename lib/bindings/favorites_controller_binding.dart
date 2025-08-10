import 'package:eskalate_project/controllers/favorites_controller.dart';
import 'package:get/get.dart';

class FavoritesControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoritesController>(() => FavoritesController());
  }
}
