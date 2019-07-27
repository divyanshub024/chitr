import 'dart:convert';

import 'package:chitr/home/model/ImageModel.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<ImageModel> getRandomImages(int count) async {
    final response = await http.get(
        'https://pixabay.com/api/?key=12986876-82bf5b8a7f2948cd66ffd41f1&editors_choice=true&per_page=$count&orientation=vertical');
    print(response.statusCode);
    if (response.statusCode == 200) {
      return ImageModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get images');
    }
  }
}
