import 'package:flutter/material.dart';

class SortMenu extends StatefulWidget {
  @override
  _SortMenuState createState() => _SortMenuState();
}

class _SortMenuState extends State<SortMenu> {
  String sortBy = 'Relevance'; // Default sort option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        PopupMenuButton<String>(
          onSelected: (value) => setState(() => sortBy = value),
          initialValue: sortBy,
          child: Row(
            children: <Widget>[
              Text(sortBy),
              Icon(Icons.arrow_drop_down),
            ],
          ),
          itemBuilder: (BuildContext context) => [
            PopupMenuItem<String>(
              value: 'Relevance',
              child: Text('Relevance'),
            ),
            PopupMenuItem<String>(
              value: 'Newest First',
              child: Text('Newest First'),
            ),
            PopupMenuItem<String>(
              value: 'Popularity',
              child: Text('Popularity'),
            ),
            PopupMenuItem<String>(
              value: 'Price: High to Low',
              child: Text('Price: High to Low'),
            ),
            PopupMenuItem<String>(
              value: 'Price: Low to High',
              child: Text('Price: Low to High'),
            ),
          ],
        ),
      ]),
    );
  }
}
