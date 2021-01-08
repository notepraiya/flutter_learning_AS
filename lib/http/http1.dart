import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models.dart';
import 'apis.dart';

class Http1 extends StatefulWidget {
  @override
  _Http1State createState() => _Http1State();
}

class _Http1State extends State<Http1> {
  Future<Album> _futureAlbum;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _futureAlbum = fetchAlbum();
  }

  void setFutureAlbum(Future<Album> futureAlbum) {
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDelete(),
        _buildCreate(),
        _buildUpdate(),
        _buildPhotoList(),
      ],
    );
  }

  Widget _buildDelete() {
    return Container(
      child: Center(
        child: FutureBuilder<Album>(
          future: _futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '${snapshot.data?.title ?? 'Deleted'}',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    ElevatedButton(
                      child: Text('Delete Data'),
                      onPressed: () {
                        setState(() {
                          _futureAlbum =
                              deleteAlbum(snapshot.data.id.toString());
                        });
                      },
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text(
                  "${snapshot.error}",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                );
              }
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Widget _buildCreate() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: (_futureAlbum == null)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(hintText: 'Enter Title'),
                ),
                ElevatedButton(
                  child: Text('Create Data'),
                  onPressed: () {
                    setState(() {
                      _futureAlbum = createAlbum(_controller.text);
                    });
                  },
                ),
              ],
            )
          : FutureBuilder<Album>(
              future: _futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data.title,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    "${snapshot.error}",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  );
                }

                return CircularProgressIndicator();
              },
            ),
    );
  }

  Widget _buildUpdate() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<Album>(
        future: _futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(snapshot.data.title),
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: 'Enter Title'),
                  ),
                  ElevatedButton(
                    child: Text('Update Data'),
                    onPressed: () {
                      setState(() {
                        _futureAlbum = updateAlbum(_controller.text);
                      });
                    },
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }

  // use Isolate compute in apis fetchPhotos(http.Client())
  Widget _buildPhotoList() {
    return Container(
      width: 250,
      height: 150,
      child: Center(
        child: FutureBuilder<List<Photo>>(
          future: fetchPhotos(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? PhotosList(photos: snapshot.data)
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<Photo> photos;

  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Image.network(photos[index].thumbnailUrl);
      },
    );
  }
}
