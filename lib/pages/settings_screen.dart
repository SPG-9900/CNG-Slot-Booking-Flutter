import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:slot_booking/controller/auth_controller.dart';
import 'package:slot_booking/pages/aboutus_screen.dart';
import 'package:slot_booking/pages/contactus_screen.dart';
import 'package:slot_booking/utils/mytheme.dart';

void main() {
  runApp(const SettingsScreen());
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation<double>? _animation;
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyTheme.appBarColor,
      appBar: AppBar(
        backgroundColor: MyTheme.appBarColor,
        centerTitle: true,
        title: const Text("Settings"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30),
        child: Text(
          "This is CNG slot bookig system for every customer who wants to save the valuable time ",
          style: TextStyle(
              fontSize: 20, color: Colors.orange, fontWeight: FontWeight.w900),
        ),
      ),
      floatingActionButton: FloatingActionBubble(
        items: <Bubble>[
          Bubble(
            title: "About us ",
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.local_activity,
            titleStyle: TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutusScreen()),
              );
              _animationController!.reverse();
            },
          ),
          Bubble(
            title: "Contact Us",
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.contact_page,
            titleStyle: TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ContactUsScreen()),
              );
              _animationController!.reverse();
            },
          ),
          Bubble(
            onPress: () {
              AuthController.instance.signOut();
            },
            title: "Log Out",
            iconColor: Colors.white,
            bubbleColor: Colors.red,
            icon: Icons.logout,
            titleStyle: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
        animation: _animation!,
        onPress: () => _animationController!.isCompleted
            ? _animationController!.reverse()
            : _animationController!.forward(),
        backGroundColor: Colors.blue,
        iconColor: Colors.white,
        iconData: Icons.menu,
      ),
    );
  }
}
