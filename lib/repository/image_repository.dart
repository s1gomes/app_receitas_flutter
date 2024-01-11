import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ImageRepository {
  late String ImageURL;

  verificaoImage(String ImageURL) async {
    try {
      bool temImagem = false;
      final String urlSubstituto = 'assets/images/miojo-gourmet.webp';
      var url = Uri.parse('Meal.imageUrl');
      var response = await http.get(url);

      if (response.statusCode == 401) {
        // statusCode == true;
        setState() {
          temImagem = false;
        };
        return Image.asset(urlSubstituto);

      }

      if (response.statusCode == 200) {
        // final json = jsonDecode(response.body);
        setState() {
          temImagem = true;
        };
        // statusCode = false;
        return Image.network(ImageURL);
      }
    } catch (e) {}
    return null;
  }
}
