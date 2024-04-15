import 'package:flutter/material.dart';
import 'package:studysync/activityScreen.dart';
import 'package:studysync/openingScreen.dart';
import 'package:studysync/schedule.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:studysync/studyTimer.dart';
import 'package:studysync/subjects.dart';
import 'package:studysync/userSettings.dart';

void main() {
  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelGroupKey: 'basic_channel_group',
          channelKey: 'basic_channel',
          channelName: 'Basic Notifications',
          channelDescription: 'Notification channel of StudySync',
          importance: NotificationImportance.Max,
          defaultPrivacy: NotificationPrivacy.Public,
          defaultRingtoneType: DefaultRingtoneType.Alarm,
          locked: true,
          enableVibration: true,
          enableLights: true,
          playSound: true,
        )
      ],
      debug: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Lato',
        appBarTheme:
            const AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
        useMaterial3: true,
      ),
      home: const OpeningScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.initState();
  }

  TabBar get _tabBar => const TabBar(
          labelColor: Colors.amber,
          unselectedLabelColor: Colors.white,
          indicatorColor: Colors.amber,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            Tab(text: 'Course Contents'),
            Tab(text: 'Quizzes'),
            Tab(text: 'Forum')
          ]);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xFF1E213D),
            title: const Text(
              "StudySync",
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
            ),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: _tabBar.preferredSize,
              child: Material(
                color: const Color(0xFF212761),
                child: _tabBar,
              ),
            )),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(
                height:
                    115, // Adjust height if necessary to fit icon and text appropriately
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xFF1E213D), // Same as AppBar background color
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.menu, color: Colors.white), // Drawer icon
                      SizedBox(width: 10), // Space between icon and text
                    ],
                  ),
                ),
              ),
              ListTile(
                title: const Text('Subjects'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Subjects()));
                },
              ),
              ListTile(
                title: const Text('User Settings'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()));
                },
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          // ScheduleScreen(),
          // ActivityScreen(),
          // StudyTimerScreen(),
        ]),
      ),
    );
  }
}
