import 'package:flutter/material.dart';
import 'package:studysync/openingScreen.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String generateRandomCode() => 'ABC123';

  TextEditingController enterCodeController = TextEditingController();
  bool scheduleToggle = true;
  bool activitiesToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'StudySync',
          style: TextStyle(color: Colors.white, fontFamily: 'Lato'),
        ),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFF1E213D),
      ),
      drawer: Drawer(
        child: Container(
          color: const Color(0xFFFCC72C),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                child: Text('Menu Bar', style: TextStyle(fontFamily: 'Lato')),
              ),
              buildDrawerItem('Item 1'),
              buildDrawerItem('Item 2'),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFFFADDAD),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildEditProfileButton(),
          buildUserProfile(),
          // buildSharedSpaceHeader(),
          // buildChooseToShare(),
          // buildToggleSwitch('Schedule', scheduleToggle, (value) {
          //   setState(() {
          //     scheduleToggle = value;
          //   });
          // }),
          // buildToggleSwitch('Activities', activitiesToggle, (value) {
          //   setState(() {
          //     activitiesToggle = value;
          //   });
          // }),
          buildInviteOrJoinPeople(),
          const SizedBox(height: 16),
          buildShareCodeSection(),
          const SizedBox(height: 16),
          buildDoneButton(),
          const SizedBox(height: 16),
          buildJoinSharedSpaceSection(),
          const SizedBox(height: 16),
          buildLogoutButton(),
        ],
      ),
    );
  }

  Widget buildDrawerItem(String title) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontFamily: 'Lato')),
      onTap: () {
        // Handle item click
      },
    );
  }

  Widget buildEditProfileButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
          },
          child: const Text(
            'Edit Profile',
            style: TextStyle(color: Colors.blue, fontFamily: 'Lato'),
          ),
        ),
      ],
    );
  }

  Widget buildUserProfile() {
    return const Column(
      children: [
        CircleAvatar(
          radius: 50,
          // backgroundImage: AssetImage('assets/profile_image.jpg'),
        ),
        SizedBox(height: 16),
        Text(
          'Username',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Lato'),
        ),
      ],
    );
  }

  // Widget buildSharedSpaceHeader() {
  //   return Container(
  //     color: const Color(0xFF212761),
  //     padding: const EdgeInsets.all(8),
  //     width: double.infinity,
  //     child: const Text(
  //       'Shared Space',
  //       style: TextStyle(color: Color(0xFFFCC72C), fontWeight: FontWeight.bold, fontFamily: 'Lato'),
  //     ),
  //   );
  // }

  // Widget buildChooseToShare() {
  //   return Container(
  //     color: const Color(0xFFFCC72C),
  //     padding: const EdgeInsets.all(8),
  //     width: double.infinity,
  //     child: const Center(
  //       child: Text(
  //         'Choose what to share',
  //         style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'Lato'),
  //       ),
  //     ),
  //   );
  // }

  Widget buildToggleSwitch(String text, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF1F255D),
        ),
        Text(text, style: const TextStyle(fontFamily: 'Lato')),
      ],
    );
  }

  Widget buildInviteOrJoinPeople() {
    return Container(
      color: const Color(0xFFFCC72C),
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      child: const Center(
        child: Text(
          'Invite or Join people',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'Lato'),
        ),
      ),
    );
  }

  Widget buildShareCodeSection() {
    return Column(
      children: [
        const Text('Share Code', style: TextStyle(fontFamily: 'Lato')),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildRandomCode(),
            const SizedBox(width: 8),
            buildCopyButton(),
          ],
        ),
      ],
    );
  }

  Widget buildRandomCode() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF212761),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Text(
          generateRandomCode(),
          style: const TextStyle(color: Color(0xFFFCC72C), fontWeight: FontWeight.bold, fontFamily: 'Lato'),
        ),
      ),
    );
  }

  Widget buildCopyButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle copy button click
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF21C713),
      ),
      child: const Text('Copy', style: TextStyle(color: Colors.white, fontFamily: 'Lato')),
    );
  }

  Widget buildDoneButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle done button click
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF21C713),
      ),
      child: const Text('Done', style: TextStyle(color: Colors.white, fontFamily: 'Lato')),
    );
  }

  Widget buildJoinSharedSpaceSection() {
    return Column(
      children: [
        const Text('Join a shared space', style: TextStyle(fontFamily: 'Lato')),
        const SizedBox(height: 8),
        buildEnterCodeTextField(),
        const SizedBox(height: 8),
        buildJoinButton(),
      ],
    );
  }

  Widget buildEnterCodeTextField() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1D2256),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 200, // Adjust the width as needed
      child: TextField(
        controller: enterCodeController,
        style: const TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter Code',
          hintStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget buildJoinButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle join button click
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF21C713),
      ),
      child: const Text('Join', style: TextStyle(color: Colors.white, fontFamily: 'Lato')),
    );
  }

  Widget buildLogoutButton() {
    return Container(
      width: double.infinity,
      color: const Color(0xFFFCC72C),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => const OpeningScreen())
          );
        },
        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFCC72C)),
        child: const Text('Log-Out', style: TextStyle(fontFamily: 'Lato', color: Colors.black)),
      ),
    );
  }
}
