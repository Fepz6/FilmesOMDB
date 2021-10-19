import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:FilmesOMDB/page/Detail.dart';
import 'package:FilmesOMDB/page/JSON_movie.dart';
import 'package:FilmesOMDB/page/MovieList.dart';
import 'package:FilmesOMDB/page/Http.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String searchText = "";
  final searchTextController = TextEditingController();

  @override

  void itemClick(Movie id) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Detail(
            movieName: id.title,
            imdbId: id.imdbID,
          )),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Center(
          child: Text("Home"),
        ),
      ),
    body: Column(
      children: <Widget> [
        Container(
          child: Row(
            children: <Widget> [
              Flexible(child: TextField(
                controller: searchTextController,
                decoration: InputDecoration(hintText: "Digite o nome do filme",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                ),
              ),),
              IconButton(
                icon: Icon(Icons.search_sharp),
                onPressed: () {
                  setState(() {
                    searchText = searchTextController.text;
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                  });
                },
              ),
            ],),
          padding: EdgeInsets.all(10),

        ),
        if (searchText.length > 0)
          FutureBuilder<List<Movie>>(
              future: searchMovies(searchText),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                      child: MovieList(
                          movies: snapshot.data,
                          Click: this.itemClick));
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              }),
      ],
    ));
  }
}


