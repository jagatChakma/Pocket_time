import 'package:flutter/material.dart';
import 'package:pocket_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> location = [
    WorldTime(url: 'Europe/London', location: "London", flag: "a_one.png"),
    WorldTime(url: 'Africa/Abidjan', location: "Abidjan", flag: "a_one.png"),
    WorldTime(url: 'Africa/Accra', location: "Accra", flag: "a_one.png"),
    WorldTime(url: 'Africa/Algiers', location: "Algiers", flag: "a_one.png"),
    WorldTime(url: 'Africa/Bissau', location: "Bissau", flag: "a_one.png"),
    WorldTime(url: 'Africa/Cairo', location: "Cairo", flag: "a_one.png"),
    WorldTime(url: 'Africa/Casablanca', location: "Casablanca", flag: "a_one.png"),
    WorldTime(url: 'Africa/Ceuta', location: "Ceuta", flag: "a_one.png"),
    WorldTime(url: 'Africa/El_Aaiun', location: "El_Aaiun", flag: "a_one.png"),
    WorldTime(url: 'Africa/Johannesburg', location: "Johannesburg", flag: "a_one.png"),
    WorldTime(url: 'Africa/Juba', location: "Juba", flag: "a_one.png"),
    WorldTime(url: 'Africa/Khartoum', location: "Khartoum", flag: "a_one.png"),
    WorldTime(url: 'Africa/Lagos', location: "Lagos", flag: "a_one.png"),
    WorldTime(url: 'Africa/Maputo', location: "Maputo", flag: "a_one.png"),
    WorldTime(url: 'Africa/Monrovia', location: "Monrovia", flag: "a_one.png"),
    WorldTime(url: 'Africa/Nairobi', location: "Nairobi", flag: "a_one.png"),
  ];

  void updateTime(index) async {
    WorldTime instance = location[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Choose a Location'),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: location.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 6.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(location[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${location[index].flag}'),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
