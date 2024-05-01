// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';

// ignore: use_key_in_widget_constructors
class ChooseLocation extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  List<WorldTime> locations = [
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London', time: ''),
    WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin', time: ''),
    WorldTime(location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo', time: ''),
    WorldTime(location: 'Nairobi', flag: 'kenya.png', url: 'Africa/Nairobi', time: ''),
    WorldTime(location: 'Chicago', flag: 'usa.png', url: 'America/Chicago', time: ''),
    WorldTime(location: 'New York', flag: 'usa.png', url: 'America/New_York', time: ''),
    WorldTime(location: 'Seoul', flag: 'south_korea.png', url: 'Asia/Seoul', time: ''),
    WorldTime(location: 'Jakarta', flag: 'indonesia.png', url: 'Asia/Jakarta', time: ''),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // ignore: use_build_context_synchronously
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
      
    });
  }


  void getData() {
    Future.delayed(const Duration(seconds: 2), () {
      print("I waited for 2 seconds");
    });
  }



  @override
  void initState() {
    super.initState();
    print("initState function run");
    getData();
  }
  @override
  Widget build(BuildContext context) {
    print("build function run");

    return Scaffold(
      backgroundColor: const Color.fromRGBO(252, 239, 250, 1),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C84CC),
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
  itemCount: locations.length,
  itemBuilder: (context, index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
      child: Card(
        child: ListTile(
          onTap: () {
            updateTime(index);
          },
          title: Text(locations[index].location),
          leading: const CircleAvatar(
          //  backgroundImage: NetworkImage(locations[index].flag),
                ),
        )
            )
          );
          
        }
      )
    );
  }
}