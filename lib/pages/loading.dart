import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupTime() async {
    WorldTime ins = WorldTime(location: 'Nairobi',flag: 'germany.png',url: 'Africa/Nairobi');
    await ins.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':ins.location,
      'flag':ins.flag,
      'time':ins.time,
      'isDayTime': ins.isDayTime
    });
  }
  void initState(){
    super.initState();
    setupTime();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
