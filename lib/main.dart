import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xkcd/models/comic_provider.dart';
import 'widgets/theme.dart';
import 'views/home_view.dart';

void main() => runApp(
      ChangeNotifierProvider(
          create: (context) => ComicProvider(), child: MyApp()),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: xkcdTheme(),
    );
  }
}
