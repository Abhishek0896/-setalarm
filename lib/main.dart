import 'package:flutter/material.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:setalarm/alarmmanager.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  runApp(new MaterialApp(home: new MyApp()));
}

class MyApp extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}
alarmCallback()
{
  NotificationManager n = new NotificationManager();
  n.initNotificationManager();
  n.showNotificationWithDefaultSound("Prova", "Prova");
  print("[*] Called from AlarmManager");
  return;
}



class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Testing Alarm Manager"),
      ),
      body: Center(
        child: Container(
          child: RaisedButton(
            child: Text("Click Me"
            ),
            onPressed: () {
              AndroidAlarmManager.oneShotAt(DateTime.now().add(Duration(minutes: 1)), 0, alarmCallback,exact: true);
            },
          ),
        ),
      ),
    );
  }

}
