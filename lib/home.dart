import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hershield_1/map_page.dart';
import 'package:hershield_1/notifcation_controller.dart';
import 'package:hershield_1/resource/post_card.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key}); // Pass key to super constructor

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 1;
  String topTitle = "Shield";
  String buttonName = 'Help';
  Color buttonColor = Colors.red;
  String afterClickHelp = 'Click to get Help';

  @override
  void initState() {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
    );
    super.initState();
  }

  // triggerNotification () {
  //   AwesomeNotifications().createNotification(
  //     content: NotificationContent(id: 10, channelKey: 'basic_channel', title: 'Success', body: 'Alert sent to nearby protectors'),
  //   );
  // }

  Widget buildAreaProfilingScreen() {
    return Scaffold(
      body: const MapPage(),
    );
  }

  Widget buildHomeScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 250, // Adjust image width
            height: 250, // Adjust image height
            child: Image.asset('images/logo.png'),
          ),
          ElevatedButton(
            onPressed: () {
              // triggerNotification();
              AwesomeNotifications().createNotification(
                content: NotificationContent(
                    id: 1,
                    channelKey: "basic_channel",
                    title: "Notification Sent",
                    body: '23 People within 500 m radius Notified'),
              );
              // Handle button press
              setState(() {
                buttonName = 'Seeker Mode';
                afterClickHelp = 'Help is on the way';
                buttonColor = Colors.blueAccent;
              });
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 200), // Adjust button size as needed
              backgroundColor:
                  buttonColor, // Change button background color to red
              foregroundColor: Colors.white, // Change text color to white
            ),
            child: Text(
              buttonName,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Text(
            afterClickHelp,
            style: const TextStyle(fontSize: 25),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 203, 235),
      appBar: AppBar(
        title: Text(
          topTitle,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 198, 67, 221),
        centerTitle: true,
      ),
      body: Center(
        child: currentIndex == 2
            ? buildHomeScreen()
            : currentIndex == 0
                ? BuildCommunityScreen()
                : currentIndex == 3
                    ? BuildProfileScreen()
                    : currentIndex == 1
                        ? buildAreaProfilingScreen()
                        : buildHomeScreen(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              label: 'Feed',
              icon: SizedBox(
                width: 30, // Adjust image width
                height: 30, // Adjust image height
                child: Image.asset('images/community.png'),
              )),
          BottomNavigationBarItem(
              label: 'Area Profile',
              icon: SizedBox(
                width: 30, // Adjust image width
                height: 30, // Adjust image height
                child: Image.asset('images/area_profile.png'),
              )),
          BottomNavigationBarItem(
              label: 'HOME',
              icon: SizedBox(
                width: 30,
                height: 30,
                child: Image.asset("images/home.png"),
              )),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: SizedBox(
              width: 30,
              height: 30,
              child: Image.asset("images/account.png"),
            ),
          )
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
            topTitle = currentIndex == 3
                ? "Profile Section"
                : currentIndex == 0
                    ? "Community Page"
                    : "HerShield";
          });
        },
      ),
    );
  }
}

class BuildCommunityScreen extends StatelessWidget {
  const BuildCommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black12,
      body: PostCard(),
    );
  }
}

class BuildProfileScreen extends StatelessWidget {
  const BuildProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 203, 235),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1712313275295-105a8ab7bb1f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDZ8NnNNVmpUTFNrZVF8fGVufDB8fHx8fA%3D%3D"),
              radius: 50,
            ),
            SizedBox(height: 20),
            const Text(
              'UserName: User',
              style: TextStyle(fontSize: 24, color: Colors.black54),
            ),
            SizedBox(height: 10),
            const Text(
              'Email:user@gmail.com',
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            SizedBox(height: 10),
            const Text(
              'Aadhaar Number: XXXX XXXX XXXX',
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutUsPage()),
                );
              },
              icon: Icon(Icons.edit),
              label: Text('About US'),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'About Us Page',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'This is a simple About Us page.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
