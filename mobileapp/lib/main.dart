import 'package:flutter/material.dart';
import 'package:mobileapp/openingScreen.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

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

class MyClass {
  final String className;
  final String section;

  MyClass({required this.className, required this.section});
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<MyClass> createdClasses = [];

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
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const Subjects()));
                },
              ),
              ListTile(
                title: const Text('User Settings'),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const SettingsPage()));
                },
              ),
            ],
          ),
        ),
        body: ListView(
          children: createdClasses.map((myClass) {
            return Card(
              child: ListTile(
                title: Text(myClass.className),
                subtitle: Text(myClass.section),
              ),
            );
          }).toList(),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showMenu(
              context: context,
              position: RelativeRect.fromLTRB(
                MediaQuery.of(context).size.width - 140.0,
                MediaQuery.of(context).size.height - 200.0,
                0.0,
                0.0,
              ),
              items: [
                PopupMenuItem(
                  child: ListTile(
                    title: Text('Create a class'),
                    onTap: () {
                      _showCreateClassDialog(context);
                    },
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(
                    title: Text('Join a class'),
                    onTap: () {
                      _showJoinClassDialog(context);
                    },
                  ),
                ),
              ],
            );
          },
          child: const Icon(Icons.add),
        )
      ),
    );
  }

  void _showCreateClassDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String className = '';
        String section = '';

        return AlertDialog(
          title: Text('Create a Class'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Class Name'),
                onChanged: (value) => className = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Section'),
                onChanged: (value) => section = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                MyClass newClass = MyClass(className: className, section: section);
                setState(() {
                  createdClasses.add(newClass);
                });
                Navigator.of(context).pop();
              },
              child: Text('Create'),
            ),
          ],
        );
      },
    );
  }

  void _showJoinClassDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Class Code'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ask your teacher for the class code.',
                style: TextStyle(color: Colors.grey[600]),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(hintText: 'Class Code'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Perform join class action here
                Navigator.of(context).pop();
              },
              child: const Text('Join'),
            ),
          ],
        );
      },
    );
  }
}
