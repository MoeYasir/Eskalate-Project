import 'package:eskalate_project/app/routes.dart';
import 'package:eskalate_project/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

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
          // Show loading only on Home tab
          if (controller.isLoading.value &&
              controller.selectedIndex.value == 0) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (controller.selectedIndex.value == 0) {
            // Home tab: search bar + filtered countries
            return Column(
              children: [
                // Search bar
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
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

                // Countries grid or no results text
                Expanded(
                  child: controller.filteredCountries.isEmpty
                      ? const Center(child: Text("No countries found"))
                      : buildCountryGrid(controller.filteredCountries),
                ),
              ],
            );
          } else {
            // Favorites tab: just show favorites
            return controller.favorites.isEmpty
                ? const Center(child: Text("No favorites yet"))
                : buildCountryGrid(controller.favorites);
          }
        }),
      ),
    );
  }

  Widget buildCountryGrid(List<CountryModel> countries) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: countries.length,
      itemBuilder: (context, index) {
        final country = countries[index];
        return buildCountryCard(country);
      },
    );
  }

  Widget buildCountryCard(CountryModel country) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.countryDetails, arguments: country);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                // Flag area background + flag text
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    country.flag,
                    style: const TextStyle(fontSize: 32),
                  ),
                ),

                // Favorite icon positioned top-right
                Positioned(
                  top: 8,
                  right: 8,
                  child: Obx(() {
                    final fav = controller.isFavorite(country);
                    return GestureDetector(
                      onTap: () => controller.toggleFavorite(country),
                      child: Icon(
                        fav ? Icons.favorite : Icons.favorite_border,
                        color: fav ? Colors.red : Colors.grey,
                      ),
                    );
                  }),
                ),
              ],
            ),

            // Info below flag
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    country.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Gap(25.h),
                  Text(
                    "Population: \n ${country.population}",
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
