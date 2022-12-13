import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:slot_booking/controller/profile_controller.dart';
import 'package:slot_booking/pages/booking_screen.dart';
import 'package:slot_booking/utils/mytheme.dart';

class BookingPunpScreen extends StatelessWidget {
  const BookingPunpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("CNG Stations in Nashik"),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Container(
              height: 75,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  color: MyTheme.appBarColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    //
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          readOnly: ProfileController.instance.isEdit.value,
                          // initialValue: name,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ),
                    //
                    const Divider(
                      thickness: 1,
                      color: MyTheme.greyColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 140),
                          child: Icon(
                            Icons.ev_station_outlined,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BookingScreen()),
                          );
                          // Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 22, 131, 232),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              " Om service station & CNG pump",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 140),
                          child: Icon(
                            Icons.ev_station_outlined,
                            size: 30,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BookingScreen()),
                          );
                          // Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 22, 131, 232),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              " Om service station & CNG pump",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 140),
                          child: Icon(
                            Icons.ev_station_outlined,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BookingScreen()),
                          );
                          // Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 22, 131, 232),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              " MNGL CNG Station",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
