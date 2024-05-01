// lib/pages/loading.dart
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// ignore: use_key_in_widget_constructors
class Loading extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  void setupWorldTime() async {


    WorldTime instance = WorldTime(location: 'Nairobi', flag: 'kenya.png', url: 'Africa/Nairobi',time: '');
    await instance.getTime();
    // ignore: avoid_print
    print(instance.time);

    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }


  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Color.fromRGBO(4, 88, 156, 1),
      body: Center(
        child: SpinKitFadingCube(
          color: Color.fromRGBO(220, 226, 231, 1),
          size: 100.0,
        ),
      )
    );
  }
}