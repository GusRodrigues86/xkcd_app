import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xkcd/constants/constants.dart';
import 'package:xkcd/models/comic_provider.dart';
import '../models/comic.dart';
import 'navigation_widget.dart';

class ComicView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ComicProvider>(
      builder: (context, provider, _) {
        return FutureBuilder(
          future: provider.current,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Container(
                child: Center(
                  child: Text(snapshot.error.toString()),
                ),
              );
            } else if (snapshot.hasData) {
              return ComicPresenter(
                data: snapshot.data as Comic,
              );
            } else {
              return Container(
                  child: Center(
                child: CircularProgressIndicator(),
              ));
            }
          },
        );
      },
    );
  }
}

class ComicPresenter extends StatelessWidget {
  final Comic data;

  const ComicPresenter({Key key, this.data}) : super(key: key);

  Widget _comicImage(Comic data) => (data.num == 404)
      ? Text('404',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            color: PrimaryColor,
            fontSize: 64,
          ))
      : Image.network(data.img);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _comicImage(data),
          ComicTitle(
            title: '${data.title}',
            alt: '${data.alt}',
          ),
          ComicNavigation(),
        ],
      ),
    );
  }
}

class ComicTitle extends StatelessWidget {
  ComicTitle({
    Key key,
    @required this.title,
    @required this.alt,
  }) : super(key: key);

  final String title;
  final String alt;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Center(
        child: Text(
          title,
          textDirection: TextDirection.ltr,
          style: TextStyle().copyWith(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFF9BD),
            border: Border.all(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              alt,
              textDirection: TextDirection.ltr,
            ),
          ),
        )
      ],
    );
  }
}
