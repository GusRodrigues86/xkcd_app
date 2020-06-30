import 'package:flutter/material.dart';
import 'package:xkcd/constants/constants.dart';
import '../widgets/comic_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          textDirection: TextDirection.ltr,
          children: <Widget>[
            Text(Name, style: Theme.of(context).textTheme.headline6),
            Text(Description, style: Theme.of(context).textTheme.subtitle2),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(child: ComicView()),
    );
  }
}
