import 'package:flutter/material.dart';
import 'package:genxp/services/PhotoService.dart';
import '../models/Image.dart';

class JsonParseImage extends StatefulWidget {
  const JsonParseImage() : super();

  @override
  _JsonParseImageState createState() => _JsonParseImageState();
}

class _JsonParseImageState extends State<JsonParseImage> {
  late List<Image> _images;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'Loading....' : 'Images'),
      ),
      body: Container(
        child: ListView(
          itemCount: null == _images ? 0 : _images.length,
        ),
      ),
    );
  }
}
