import 'package:flutter/material.dart';
import 'package:slot_booking/pages/generateinvoice_screen.dart';

class InvoiceScreen extends StatelessWidget {
  final String selectedTimeSlot;
  final DateTime selectedDate;

  const InvoiceScreen({
    Key? key,
    required this.selectedTimeSlot,
    required this.selectedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Invoice Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  size: 24,
                  color: Colors.blueGrey,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Date:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  Icons.access_time,
                  size: 24,
                  color: Colors.blueGrey,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Selected Time Slot:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  selectedTimeSlot,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GenerateInvoiceScreen(),
                    ),
                  );
                  // Implement logic for invoice generation or further actions
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: const TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Generate Invoice'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
