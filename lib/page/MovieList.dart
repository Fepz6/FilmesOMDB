import 'package:flutter/material.dart';
import 'package:FilmesOMDB/page/JSON_movie.dart';
import 'package:FilmesOMDB/page/JSON_movie.dart' as model;


class MovieList extends StatelessWidget {
  final List<Movie> movies;
  final Function Click;

  MovieList({this.movies, this.Click});

  @override
  Widget build(context) {
    return Container(
        decoration: BoxDecoration(color: Colors.grey),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            padding: const EdgeInsets.all(2.0),
            itemCount: this.movies.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  child: MovieGrid(movie: this.movies[index]),
                  onTap: () => this.Click(this.movies[index]));
            }));
  }
}

class MovieGrid extends StatelessWidget {
  final model.Movie movie;
  MovieGrid({this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(children: <Widget>[
            Image.network(this.movie.poster, height: 115, width: 200)
          ]),
          Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(this.movie.title),
                Text(this.movie.year),
              ]),)
        ],
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB( 8.0, 10.0, 10.0, 0.0),
      decoration:
      BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),color: Colors.white),
    );
  }
}

