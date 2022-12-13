import 'package:flutter/material.dart';

class NodataScreen extends StatefulWidget {
  const NodataScreen({Key? key}) : super(key: key);

  @override
  State<NodataScreen> createState() => _NodataScreenState();
}

class _NodataScreenState extends State<NodataScreen> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Service is Commming Soon....',
      style: optionStyle,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
