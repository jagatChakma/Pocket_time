import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url; //aou url
  bool isDaytime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      //get properties from data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      //print(dateTime);
      print(offset);

      // create dateTime object
      DateTime noww = DateTime.parse(dateTime);
      noww = noww.add(Duration(hours: int.parse(offset)));

      //set the time property
      isDaytime = noww.hour > 6 && noww.hour < 20  ? true : false;
      time = DateFormat.jm().format(noww);

    } catch (c) {
      print('Caught error:$c');
      time = 'could not get any time';
    }
  }
}
