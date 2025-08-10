import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../../models/country_model.dart';
import '../../app/routes.dart';

class CountryCard extends StatelessWidget {
  final CountryModel country;

  const CountryCard({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

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
