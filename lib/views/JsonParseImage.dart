import 'package:flutter/material.dart';
import 'package:genxp/services/PhotoService.dart';
import '../models/Image.dart';

class JsonParseImage extends StatefulWidget {
  const JsonParseImage() : super();

  @override
  _JsonParseImageState createState() => _JsonParseImageState();
}

class _JsonParseImageState extends State<JsonParseImage> {
  late List<Photo> _images;
  late bool _loading;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading = true;
    PhotoService.getPhotos().then((images) {
      setState(() {
        _images = images;
        _loading = false;
      });
    });
  }

  Widget _dialogBuilder(BuildContext context, Photo image) {
    ThemeData localTheme = Theme.of(context);
    return SimpleDialog(
      children: [
        Image.network(
          image.url,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  Widget _listItemBuider(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) => _dialogBuilder(context, _images[index]),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(_images[index].title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'Loading....' : 'Production'),
      ),
      body: ListView.builder(
        itemCount: null == _images ? 0 : _images.length,
        itemBuilder: _listItemBuider,
        itemExtent: 60.0,
      ),
    );
  }
}
