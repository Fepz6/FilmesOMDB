import 'package:flutter/material.dart';
import 'package:FilmesOMDB/page/Http.dart';
import 'package:FilmesOMDB/page/JSON_info.dart';



class Detail extends StatelessWidget {
  final String movieName;
  final String imdbId;

  Detail({this.movieName, this.imdbId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(this.movieName),
      ),
      body: FutureBuilder<MovieInfo>(
          future: getMovie(this.imdbId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          alignment: Alignment.center,
                          child: Image.network(
                            snapshot.data.poster,
                            width: 250,
                          ),
                        ),
                        Text(snapshot.data.plot),
                        Text("Year : " + snapshot.data.year),
                        Text("Genre : " + snapshot.data.genre),
                        Text("Directed by : " + snapshot.data.director),
                        Text("Runtime : " + snapshot.data.runtime),
                        Text("Rated : " + snapshot.data.rating),
                        Text("IMDB Rating : " + snapshot.data.imdbRating),
                        Text("Meta Score : " + snapshot.data.metaScore),
                      ]));
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
