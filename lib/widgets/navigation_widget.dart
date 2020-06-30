import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xkcd/models/comic_provider.dart';

class ComicNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      textDirection: TextDirection.ltr,
      children: <Widget>[
        NavButton(
          action: '|<',
          onPressed: () =>
              Provider.of<ComicProvider>(context, listen: false).first(),
        ),
        NavButton(
          action: '<',
          onPressed: () =>
              Provider.of<ComicProvider>(context, listen: false).previous(),
        ),
        NavButton(
          action: '?',
          onPressed: () =>
              Provider.of<ComicProvider>(context, listen: false).random(),
        ),
        NavButton(
          action: '>',
          onPressed: () =>
              Provider.of<ComicProvider>(context, listen: false).next(),
        ),
        NavButton(
          action: '>|',
          onPressed: () =>
              Provider.of<ComicProvider>(context, listen: false).latest(),
        ),
      ],
    );
  }
}

class NavButton extends StatelessWidget {
  final String action;
  final VoidCallback onPressed;

  const NavButton({
    Key key,
    @required this.action,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(2),
        child: RaisedButton(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
            side: BorderSide(color: Colors.black),
          ),
          onPressed: onPressed,
          child: Text(action),
          textColor: Colors.white,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
