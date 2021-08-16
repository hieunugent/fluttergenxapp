import 'package:http/http.dart' as http;
import '../others/Users.dart';

class Service {
  static const String url = 'https://jsonplaceholder.typicode.com/users';
  static Future<List<User>> getUsers() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<User> users = usersFromJson(response.body);
        return users;
      }else{
        return 
      }
    } catch (e) {
      return List<User>();
    }
  }
}
