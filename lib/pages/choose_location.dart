import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        location: 'Jakarta',
        flag: 'indonesia.png',
        latitude: '6.2088',
        longitude: '106.8456'),
    WorldTime(
        location: 'Athens',
        flag: 'greece.png',
        latitude: '37.9838',
        longitude: '23.7275'),
    WorldTime(
        location: 'Seoul',
        flag: 'south_korea.png',
        latitude: '37.532600',
        longitude: '1127.024612'),
    WorldTime(
        location: 'Cairo',
        flag: 'egypt.png',
        latitude: '30.0444',
        longitude: '31.2357'),
    WorldTime(
        location: 'Nairobi',
        flag: 'kenya.png',
        latitude: '1.2921',
        longitude: '36.8219'),
    WorldTime(
        location: 'London',
        flag: 'uk.png',
        latitude: '51.509865',
        longitude: '-0.118092'),
    WorldTime(
        location: 'Berlin',
        flag: 'germany.png',
        latitude: '52.520008',
        longitude: '13.404954'),
    WorldTime(
        location: 'Washington DC',
        flag: 'usa.jpg',
        latitude: '38.9072',
        longitude: '77.0369'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
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
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
      //body: ElevatedButton(
      //  onPressed: () {
      //    setState(() {
      //      counter += 1;
      //    });
      //  },
      //  child: Text('counter is $counter'),
    );
    //);
  }
}
