import 'package:flutter/material.dart';
import 'package:slot_booking/utils/mytheme.dart';

class CityScreen extends StatelessWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.appBarColor,
        centerTitle: true,
        title: Text("Cities"),
      ),
    );
  }
}
