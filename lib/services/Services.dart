import 'package:http/http.dart' as http;
import '../others/Users.dart';

class Services {
  static const String url = 'https://jsonplaceholder.typicode.com/users';
  static Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse(url));
    if (200 == response.statusCode) {
      final List<User> users = usersFromJson(response.body);
      return users;
    } else {
      throw Exception('Failed to load user');
    }
  }
}
