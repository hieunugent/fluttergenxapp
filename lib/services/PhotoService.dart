import 'package:http/http.dart' as http;
import '../models/Image.dart';

class PhotoService {
  static const String url = 'https://jsonplaceholder.typicode.com/photos';
  static Future<List<Image>> getPhotos() async {
    final response = await http.get(Uri.parse(url));
    if (200 == response.statusCode) {
      final List<Image> images = imageFromJson(response.body);
      return images;
    } else {
      throw Exception('Failed to load image');
    }
  }
}
