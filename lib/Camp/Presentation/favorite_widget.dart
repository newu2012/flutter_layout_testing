import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggleFavorite,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(0),
            child: Icon(
              _isFavorited ? Icons.star : Icons.star_border,
              color: Colors.red[500],
            ),
          ),
          SizedBox(
            width: 18,
            child: SizedBox(
              child: Text('$_favoriteCount'),
            ),
          ),
        ],
      ),
    );
  }
}
