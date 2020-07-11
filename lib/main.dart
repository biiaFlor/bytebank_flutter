import 'package:flutter/material.dart';

void main() => runApp(
      Column(
        children: <Widget>[
          Text(
            'Campo text 1 - column 1',
            textDirection: TextDirection.ltr,
          ),
          Text(
            'Campo text 2 - column 1',
            textDirection: TextDirection.ltr,
          ),
          Text(
            'Campo text 3 - column 1',
            textDirection: TextDirection.ltr,
          ),
          Column(children: <Widget>[
            Text(
              'Campo text 1 - column 2',
              textDirection: TextDirection.ltr,
            ),
          ])
        ],
      ), //Column
    );
