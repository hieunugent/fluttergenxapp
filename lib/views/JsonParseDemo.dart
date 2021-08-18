import 'package:flutter/material.dart';
import '../others/Users.dart';
import '../services/Services.dart';

class JsonParseDemo extends StatefulWidget {
  const JsonParseDemo() : super();

  @override
  _JsonParseDemoState createState() => _JsonParseDemoState();
}

class _JsonParseDemoState extends State<JsonParseDemo> {
  late List<User> _users;
  late bool _loading;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading = true;
    Services.getUsers().then((users) {
      setState(() {
        _users = users;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'Loading...' : 'Users'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
            itemCount: null == _users ? 0 : _users.length,
            itemBuilder: (context, index) {
              User user = _users[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
              );
            }),
      ),
    );
  }
}
