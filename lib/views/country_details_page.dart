import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../models/country_model.dart';
import '../controllers/home_controller.dart';

class CountryDetailsPage extends StatelessWidget {
  final CountryModel country;

  CountryDetailsPage({super.key, required this.country});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xFF295D9F),
        ),
        title: const Text("Country Details"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
            final homeController = Get.find<HomeController>();
            homeController.clearSearchAndReset();
          },
        ),
        actions: [
          Obx(() {
            final isFav = controller.isFavorite(country);
            return IconButton(
              icon: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: isFav ? Colors.redAccent : const Color(0xFF295D9F),
              ),
              onPressed: () => controller.toggleFavorite(country),
            );
          }),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Flag emoji
            Center(
              child: Text(
                country.flag,
                style: const TextStyle(fontSize: 64),
              ),
            ),
            const SizedBox(height: 24),
            // White container for details
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Country name
                  Text(
                    country.name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32),
                  _buildInfoRow("Population", country.population.toString()),
                  _buildInfoRow("Area", "${country.area} km²"),
                  _buildInfoRow("Region", country.region),
                  _buildInfoRow("Subregion", country.subregion),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Timezones",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // Timezones wrapped in small containers
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: country.timezones.map((tz) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    tz,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          // const SizedBox(width: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
