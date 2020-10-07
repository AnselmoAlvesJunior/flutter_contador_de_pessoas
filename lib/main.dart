import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Contador de pessoas",
      home: home()));
}

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  int _people=0;
  String _infoText ="Pode entrar";
  void changePeople(int delta){
    setState(() {
      _people+=delta;
      if(_people<0) {
        _infoText = "Mundo invertido?";
      }
      else if(_people<=10) {
        _infoText = "Pode entrar!";
      }
      else if(_people>10) {
        _infoText = "Sentimos muito, está lotado.";
      }
    });
  }
  @override
    Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        "images/restaurant.jpg",
        fit: BoxFit.cover,
        height: 1000.0,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Pessoas: $_people",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  child: Text(
                    "+1",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  onPressed: () {changePeople(1);},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  child: Text(
                    "-1",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  onPressed: () {changePeople(-1);
                  },
                ),
              ),
            ],
          ),
          Text(
            _infoText,
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 30.0),
          )
        ],
      )
    ]);
  }
}
