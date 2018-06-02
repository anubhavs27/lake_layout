import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {



  Container returnIconContainer(IconData icon, String string) {
    return new Container(child: 
    new Column(
      mainAxisSize: MainAxisSize.min,
        children: <Widget>[new Icon(icon, color: Colors.blue), new Text(string, style: new TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: Colors.blue))])
    );
  }

      
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new FavoriteWidget()
        ],
      ),
    );
    final iconSection = new Container(padding: EdgeInsets.all(32.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            returnIconContainer(Icons.phone, 'CALL'),
            returnIconContainer(Icons.near_me, 'ROUTE'),
            returnIconContainer(Icons.share, 'SHARE')
          ],
        )
    );

    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );

    final home = new ListView(
      children: <Widget>[
      new Column(
        children: <Widget>[
          Image.asset('images/lake.jpg',
            width: 600.0,
            height: 240.0,
            fit: BoxFit.cover,),
          titleSection,
          iconSection,
          textSection
        ],
      )
    ]);

    return new MaterialApp(
      title: 'Oeschenin Lake Campground',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        body: home
      ),
    );


  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => new _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State {
  bool _isFavorited = true;
  int _rating = 41;

  void _onPressed () {
    setState(() {
      if (_isFavorited){
        _rating -= 1;
        _isFavorited = false;
      } else {
        _rating += 1;
        _isFavorited = true;
      }
    }

    );
}

@override
  Widget build(BuildContext build){
    return new Row ( children: <Widget>[new IconButton(
      icon: (_isFavorited
          ? new Icon(Icons.star)
          : new Icon(Icons.star_border)),
      color: Colors.red[500],
      onPressed: _onPressed,
    ),
  new Text('$_rating'),],
    );
}


}


