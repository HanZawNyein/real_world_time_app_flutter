import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading...';

  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'Yangon', flag: 'Myanmar.jpg', url: 'Asia/Yangon');
    // await instance.getTime();
    await instance.getTime();
    // time
    // print(instance.time);
    // setState(() {
    //   time = instance.time;
    // });
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Center(
          child: SpinKitThreeBounce(
            color: Colors.teal,
            size: 80.0,
          ),
        ),
      ),
    );
  }
}
