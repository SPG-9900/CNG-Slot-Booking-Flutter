import 'package:flutter/material.dart';
import 'package:slot_booking/utils/mytheme.dart';

class AboutusScreen extends StatelessWidget {
  const AboutusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.appBarColor,
      appBar: AppBar(
        backgroundColor: MyTheme.appBarColor,
        title: const Text("About us"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            SizedBox(
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                "Think gas is an environmentally-conscious company,which aims fast transfer of the CNG gas to consumers. So we introducing the CNG management system to best practices in safety, and customer relationship management in city gas distribution.We are going to operate between three city they are Mumbai, Pune, Nashik. And they are going to be rolled out in many filling station in particular city.In this the slot is usually assigned within two or three hours after the online booking.The customer can only book the slot on this website but by their convenient time.We serve an global priority to a time saving mechanism and provide 100 cent of costomer satisfaction.......",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
