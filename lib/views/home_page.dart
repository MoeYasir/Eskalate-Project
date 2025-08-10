import 'package:eskalate_project/widgets/country_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

// Import the extracted widgets

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            selectedItemColor: const Color(0xFF295D9F),
            unselectedItemColor: const Color(0xFF7A7A7A),
            backgroundColor: const Color(0xFFE6F0FA),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border_rounded),
                  label: 'Favorites'),
            ],
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changeTab,
          )),
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value &&
              controller.selectedIndex.value == 0) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Color(0xFF295D9F),
                  ),
                  Gap(15.h),
                  Text("Loading Countries...")
                ],
              ),
            );
          }

          if (controller.selectedIndex.value == 0) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: controller
                        .searchController, // <-- use the controller here
                    decoration: InputDecoration(
                      hintText: "Search countries...",
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: controller.searchCountries,
                  ),
                ),
                Expanded(
                  child: controller.filteredCountries.isEmpty
                      ? const Center(child: Text("No countries found"))
                      : CountryGrid(countries: controller.filteredCountries),
                ),
              ],
            );
          } else {
            return controller.favorites.isEmpty
                ? const Center(child: Text("No favorites yet"))
                : CountryGrid(countries: controller.favorites);
          }
        }),
      ),
    );
  }
}
