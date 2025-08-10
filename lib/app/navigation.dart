import 'package:eskalate_project/app/routes.dart';
import 'package:eskalate_project/bindings/country_details_binding.dart';
import 'package:eskalate_project/bindings/home_controller_binding.dart';
import 'package:eskalate_project/views/country_details_page.dart';
import 'package:eskalate_project/views/home_page.dart';
import 'package:get/route_manager.dart';

class Navigation {
  static List<GetPage> routes = [
    GetPage(
        name: Routes.home,
        page: () => HomePage(),
        binding: HomeControllerBinding()),
    GetPage(
        name: Routes.countryDetails,
        page: () => CountryDetailsPage(
              country: Get.arguments,
            ),
        binding: CountryDetailsControllerBinding()),

    // Add more routes here as needed
  ];
}
