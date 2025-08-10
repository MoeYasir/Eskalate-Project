import 'package:eskalate_project/controllers/home_controller.dart';
import 'package:eskalate_project/widgets/country_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isHome = controller.selectedIndex.value == 0;

      return Scaffold(
        appBar: AppBar(
          title: Text(isHome ? 'Home' : 'Favorites'),
          centerTitle: true,
          backgroundColor: const Color(0xFFE6F0FA),
          foregroundColor: const Color(0xFF295D9F),
          elevation: 2,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color(0xFF295D9F),
          unselectedItemColor: const Color(0xFF7A7A7A),
          backgroundColor: const Color(0xFFE6F0FA),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_rounded), label: 'Favorites'),
          ],
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeTab,
        ),
        body: SafeArea(
          child: isHome
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        controller: controller.searchController,
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
                      child: controller.isLoading.value
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    color: const Color(0xFF295D9F),
                                  ),
                                  const SizedBox(height: 15),
                                  const Text("Loading Countries..."),
                                ],
                              ),
                            )
                          : controller.filteredCountries.isEmpty
                              ? const Center(child: Text("No countries found"))
                              : RefreshIndicator(
                                  onRefresh: () async {
                                    controller.fetchCountries();
                                    controller.clearSearchAndReset();
                                  },
                                  child: CountryGrid(
                                      countries: controller.filteredCountries),
                                ),
                    ),
                  ],
                )
              : controller.favorites.isEmpty
                  ? const Center(child: Text("No favorites yet"))
                  : RefreshIndicator(
                      onRefresh: () async {
                        await controller.loadFavorites();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CountryGrid(countries: controller.favorites),
                      ),
                    ),
        ),
      );
    });
  }
}
