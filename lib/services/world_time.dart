import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  late String time;
  String flag;
  String url;
  late bool isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // print(this.url);
      var url = Uri.https('worldtimeapi.org', '/api/timezone/${this.url}');
      print(url);
      Response response = await get(url);
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        // print(data);
        //  get properties
        String datatime = data['datetime'];
        String offset = data['utc_offset'];
        // print(offset.substring(1, 3));
        // print(offset.substring(4, 6));
        DateTime now = DateTime.parse(datatime);
        // int hours = ;
        // int minutes = int.parse(offset.substring(4, 6));
        // print(hours);
        // print(minutes);
        now.add(Duration(
            hours: int.parse(offset.substring(1, 3)),minutes: int.parse(offset.substring(4, 6)))); //, minutes: 30));
        print(now);
        isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
        // isDayTime = false;
        time = DateFormat.jm().format(now);
        // time = now.toString();
        // print(time);
      } else {
        time = 'could not get data.';
        // print(time);
      }
    } catch (e) {
      // print(e);
      time = 'could not get data.'; //e.toString();
    }
  }
}

WorldTime instance =
    WorldTime(location: 'Yangon', flag: 'Myanmar.jpg', url: 'Asia/Yangon');
// instance.getTime();
