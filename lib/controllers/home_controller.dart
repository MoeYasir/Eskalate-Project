import 'package:eskalate_project/services/api_services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/country_model.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var countries = <CountryModel>[].obs;
  var filteredCountries = <CountryModel>[].obs;
  var favorites = <CountryModel>[].obs;
  var selectedIndex = 0.obs;

  final ApiService _service = ApiService();

  @override
  void onInit() {
    fetchCountries();
    loadFavorites();
    super.onInit();
  }

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  void fetchCountries() async {
    isLoading.value = true;
    try {
      final result = await _service.fetchCountries();
      countries.assignAll(result);
      filteredCountries.assignAll(result);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void searchCountries(String query) {
    if (query.isEmpty) {
      filteredCountries.assignAll(countries);
    } else {
      filteredCountries.assignAll(
        countries
            .where((c) => c.name.toLowerCase().contains(query.toLowerCase())),
      );
    }
  }

  bool isFavorite(CountryModel country) {
    return favorites.any((f) => f.name == country.name);
  }

  void toggleFavorite(CountryModel country) {
    if (isFavorite(country)) {
      favorites.removeWhere((f) => f.name == country.name);
    } else {
      favorites.add(country);
    }
    saveFavorites();
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favList =
        favorites.map((c) => jsonEncode(_countryToJson(c))).toList();
    await prefs.setStringList('favorites', favList);
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? favList = prefs.getStringList('favorites');
    if (favList != null) {
      favorites.assignAll(
        favList.map((c) => CountryModel.fromJson(jsonDecode(c))).toList(),
      );
    }
  }

  Map<String, dynamic> _countryToJson(CountryModel c) {
    return {
      "name": {"common": c.name},
      "population": c.population,
      "flag": c.flag,
      "area": c.area,
      "region": c.region,
      "subregion": c.subregion,
      "timezones": c.timezones,
    };
  }
}
