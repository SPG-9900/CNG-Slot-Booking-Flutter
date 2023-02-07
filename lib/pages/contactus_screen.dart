import 'package:flutter/material.dart';
import 'package:slot_booking/utils/mytheme.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.appBarColor,
      appBar: AppBar(
        backgroundColor: MyTheme.appBarColor,
        title: const Text("Contact Us"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Container(
              height: 100,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  color: MyTheme.blueBorder,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(180),
                      bottomRight: Radius.circular(180))),
            ),
            SizedBox(
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Text(
                "Our Team :",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 210),
              child: Text(
                "Prathamesh Sahare - 7875926500",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(top: 330),
              child: Text(
                "Address: MET's Institute Of Engineering, Nashik, Maharashtra, India, Bhujbal Knowledge City, Adgaon, Nashik, Maharashtra 422207",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
