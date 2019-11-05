import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  createState() => _AppState();
}

class _AppState extends State<App> {
  int _people = 0;
  String _text = 'Be welcome!';

  Widget texto({String value}) {
    return Text(
      value,
      style: TextStyle(fontSize: 30.0, color: Colors.white),
    );
  }

  void _changeAmountPeople(int num) {
    setState(() {
      _people += num;

      if (_people > 10) {
        _text = 'Crowed!';
      } else if (_people < 0) {
        _text = 'There is something wrong';
      } else {
        _text = 'Come in!';
      }
    });
  }

  @override
  build(BuildContext context) {
    return MaterialApp(
        title: 'People counter',
        home: Container(
          color: Colors.purple,
          child: Stack(
            children: <Widget>[
              Image.asset(
                'images/restaurant.jpg',
                fit: BoxFit.cover,
                height: 1000.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  texto(value: 'People counter'),
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                            child: texto(value: '-1'),
                            onPressed: () {
                              _changeAmountPeople(-1);
                            },
                          ),
                          FlatButton(
                            child: texto(value: '+1'),
                            onPressed: () {
                              _changeAmountPeople(1);
                            },
                          ),
                        ],
                      )),
                  texto(value: '$_people'),
                  texto(value: _text),
                ],
              ),
            ],
          ),
        ));
  }
}
