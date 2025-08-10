import 'package:dio/dio.dart';
import '../models/country_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<CountryModel>> fetchCountries() async {
    const String url =
        "https://restcountries.com/v3.1/independent?status=true&fields=name,population,flag,area,region,subregion,timezones,flags";
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        List data = response.data;
        return data.map((json) => CountryModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load countries');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
