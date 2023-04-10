import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Map data = {'location': 'Yangon', 'flag': 'Myanmar.jpg', 'url': 'Asia/Yangon','time':'1234'};
  Map data = {};

  //     {}; //'location': 'Yangon', 'flag': 'Myanmar.jpg', 'url': 'Asia/Yangon','time':'1234'};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    // print(data);
    // String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.teal : Colors.indigo;
    // Color fgColor = data['isDayTime'] ? Colors.white : Colors.white;

    return Scaffold(
        backgroundColor: bgColor,
        // appBar: AppBar(
        //   title: Text("Choose"),
        // ),
        body: SafeArea(
      child: Container(
        // decoration: BoxDecoration(
        //   color: ${isDayTime}?Colors.deepOrange:Colors.teal,
        // ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: <Widget>[
              TextButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  // print(result);
                  setState(() {
                    data = {
                      'location': result['location'],
                      'flag': result['flag'],
                      'url': result['url'],
                      'time': result['time'],
                      'isDayTime':result['isDayTime']
                    };
                  });
                },
                icon: Icon(Icons.edit_location),
                label: Text("Edit Location"),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(fontSize: 28, letterSpacing: 3),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 50,
                  // letterSpacing: 2,
                ),
              ),
              // Text(bgImage),
            ],
          ),
        ),
      ),
    ));
  }
}
