import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        buttonColor: Colors.amber,
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class Kitten {
  const Kitten({
    required this.name,
    required this.description,
    required this.age,
    required this.imageUrl,
  });
  final String name;
  final String description;
  final int age;
  final String imageUrl;
}

final String server =
    defaultTargetPlatform == TargetPlatform.android ? "10.0.2.2" : "localhost";
final List<Kitten> _kittens = <Kitten>[
  Kitten(
    name: 'Mitten',
    description: 'the principle of cat when mitten sits in your lab '
        ' your feel like royalty',
    age: 11,
    imageUrl: 'http://$server:8000/kitten0.jpg',
  ),
  Kitten(
    name: 'Flutttey',
    description: 'The world\'s cutest kitten. Seriously. we did the research'
        ' your feel like royalty',
    age: 3,
    imageUrl: 'http://$server:8000/kitten1.jpg',
  ),
  Kitten(
    name: 'Scooter',
    description: 'Chases string fastest than others',
    age: 10,
    imageUrl: 'http://$server:8000/kitten2.jpg',
  ),
  Kitten(
    name: 'Steve',
    description: 'Steve is cool and just kind of hangs out.',
    age: 4,
    imageUrl: 'http://$server:8000/kitten3.jpg',
  ),
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  Widget _dialogBuilder(BuildContext context, Kitten kitten) {
    ThemeData localTheme = Theme.of(context);
    return SimpleDialog(
      children: [
        Image.network(
          kitten.imageUrl,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                kitten.name,
                style: localTheme.textTheme.headline4,
              ),
              Text(
                '${kitten.age} months old',
                style: localTheme.textTheme.subtitle1!.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                kitten.description,
                style: localTheme.textTheme.bodyText2,
              ),
              SizedBox(
                height: 16.0,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Wrap(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('I\'M ALLERGIC'),
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: const Text('ADOPT')),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) => _dialogBuilder(context, _kittens[index]),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(_kittens[index].name,
            style: Theme.of(context).textTheme.headline6),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Kittens'),
        actions: [],
      ),
      body: ListView.builder(
        itemBuilder: _listItemBuilder,
        itemExtent: 60.0,
        itemCount: _kittens.length,
      ),
    );
  }
}
