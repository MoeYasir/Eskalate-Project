import 'package:flutter/material.dart';
import '../../models/country_model.dart';
import 'country_card.dart';

class CountryGrid extends StatelessWidget {
  final List<CountryModel> countries;

  const CountryGrid({super.key, required this.countries});

  @override
  Widget build(BuildContext context) {
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
        return CountryCard(country: country);
      },
    );
  }
}
