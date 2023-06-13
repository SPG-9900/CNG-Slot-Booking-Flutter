import 'package:flutter/material.dart';
import 'package:slot_booking/pages/invoice_screen.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  _SlotBookingScreenState createState() => _SlotBookingScreenState();
}

class _SlotBookingScreenState extends State<BookingScreen> {
  DateTime _selectedDate = DateTime.now();

  final List<String> _timeSlots = [
    '12:20 AM ',
    '12:00 AM ',
    '12:40 AM',
    '1:00 AM',
    '1:20 AM',
    '1:40 AM',
    '2:00 AM',
    '2:20 AM',
    '2:40 AM',
    '3:00 AM',
    '3:20 AM',
    '3:40 AM',
    '4:00 AM',
    '4:20 AM',
    '4:40 AM',
    '5:00 AM',
    '5:20 AM',
    '5:40 AM',
    '6:00 AM',
    '6:20 AM',
    '6:40 AM',
    '7:00 AM',
    '7:20 AM',
    '7:40 AM',
    '8:00 AM',
    '8:20 AM',
    '8:40 AM',
    '9:00 AM',
    '9:20 AM',
    '9:40 AM',
    '10:00 AM',
    '10:20 AM',
    '10:40 AM',
    '11:00 AM',
    '11:20 AM',
    '11:40 AM',
    '12:20 PM ',
    '12:00 PM ',
    '12:40 PM',
    '1:00 PM',
    '1:20 PM',
    '1:40 PM',
    '2:00 PM',
    '2:20 PM',
    '2:40 PM',
    '3:00 PM',
    '3:20 PM',
    '3:40 PM',
    '4:00 PM',
    '4:20 PM',
    '4:40 PM',
    '5:00 PM',
    '5:20 PM',
    '5:40 PM',
    '6:00 PM',
    '6:20 PM',
    '6:40 PM',
    '7:00 PM',
    '7:20 PM',
    '7:40 PM',
    '8:00 PM',
    '8:20 PM',
    '8:40 PM',
    '9:00 PM',
    '9:20 PM',
    '9:40 PM',
    '10:00 PM',
    '10:20 PM',
    '10:40 PM',
    '11:00 PM',
    '11:20 PM',
    '11:40 PM',
  ];
  int _selectedSlotIndex = -1;

  bool _isLoading = false; // Boolean variable to track loading state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slot Booking'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            child: CalendarDatePicker(
              initialDate: _selectedDate,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 30)),
              onDateChanged: (date) {
                setState(() {
                  _selectedDate = date;
                  _selectedSlotIndex =
                      -1; // Reset selected slot index for new date
                });
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: _timeSlots.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedSlotIndex = index; // Update selected slot index
                    });
                  },
                  child: ClipOval(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: _selectedSlotIndex == index
                            ? Colors.orange // Color for selected slot
                            : Colors.green, // Color for unselected slots
                      ),
                      child: Center(
                        child: Text(
                          _timeSlots[index],
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: ElevatedButton(
                onPressed: _selectedSlotIndex == -1 || _isLoading
                    ? null
                    : () async {
                        setState(() {
                          _isLoading = true; // Set loading state to true
                        });
                        // Implement logic for button press here
                        await Future.delayed(const Duration(seconds: 3));

                        setState(() {
                          _isLoading = false; // Set loading state back to false
                        });

                        if (!_isLoading) {
                          // Navigate to InvoiceScreen after loading is complete
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InvoiceScreen(
                                selectedTimeSlot:
                                    _timeSlots[_selectedSlotIndex],
                                selectedDate: _selectedDate,
                              ),
                            ),
                          );
                        }
                      },
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
                        'Book Selected Slot',
                        style: TextStyle(fontSize: 20),
                      ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
