import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:genxp/services/api_manager.dart';
import '../models/album.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Album> _newAlbum;
  @override
  void initState() {
    _newAlbum = API_manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: null,
              icon: const Icon(Icons.arrow_back_ios),
            );
          },
        ),
        title: const Text('Fetch Data Example'),
        actions: [
          IconButton(
            onPressed: null,
            icon: const Icon(Icons.add_shopping_cart),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'GenX',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                IconButton(
                    onPressed: null, icon: Icon(Icons.view_list_rounded)),
                IconButton(onPressed: null, icon: Icon(Icons.grid_view))
              ],
            ),
          ),
          Expanded(
            child: StaggeredGridView.countBuilder(
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                crossAxisCount: 2,
                itemCount: 1000,
                itemBuilder: (context, index) {
                  return Container(
                    height: 200,
                    width: 100,
                    color: Colors.amber,
                  );
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1)),
          )
        ],
      ),
    );
  }
}
