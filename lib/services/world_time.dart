// lib/services/world_time.dart
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  late bool isDaytime; // true or false if daytime or not

  WorldTime({required this.location, required this.flag, required this.url, required this.time}) {
    isDaytime = false; // initialize isDaytime in the constructor
  }

   Future<void> getTime() async {
    try {
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        String datetime = data['datetime'];
        String offset = data['utc_offset'].substring(1, 3);
        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(offset)));

        time = DateFormat.jm().format(now);

        // Calculate isDaytime based on hour
        int hour = now.hour;
        isDaytime = hour >= 6 && hour < 18;
      } 
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching time: $e');

    }
  }
}

void main() async {
  WorldTime worldTime = WorldTime(location: "Nairobi", flag: "flag_url", url: "url", time: "time");
  await worldTime.getTime(); // Call getTime() to fetch the time
  // ignore: avoid_print
  print(worldTime.time); // Now, access the time
}

