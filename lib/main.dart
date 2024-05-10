import 'package:flutter/material.dart';
import 'package:hershield_1/login.dart';
import 'package:hershield_1/register.dart';
import 'package:hershield_1/home.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() async {
  await AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelGroupKey: 'basic_channel_group',
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for Alerts',
        defaultColor: Color(0xFF9D50DD),
        ledColor: Colors.white)
  ],
  channelGroups: [
    NotificationChannelGroup(channelGroupKey: 'basic_channel_group', channelGroupName: 'Basic Group')
  ],
  debug: true,
  );

  bool isAllowedToSendNotification = await AwesomeNotifications().isNotificationAllowed();
  if(!isAllowedToSendNotification){
    AwesomeNotifications().requestPermissionToSendNotifications();
  }



  runApp(
    MaterialApp(
    debugShowCheckedModeBanner: false,
      initialRoute: 'login', 
      routes: {
        'login':(context) =>const Mylogin(),
        'register':(context)=>const MyRegister(),
        'home':(context) =>const MyApp()
        },
    ),
  );
}

