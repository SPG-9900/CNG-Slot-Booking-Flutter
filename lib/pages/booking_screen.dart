import 'package:flutter/material.dart';
import 'package:booking_calendar/booking_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:slot_booking/utils/mytheme.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const BookingScreen()));
}

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingCalendarDemoAppState();
}

class _BookingCalendarDemoAppState extends State<BookingScreen> {
  final now = DateTime.now();
  late BookingService mockBookingService;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    DateTime now = DateTime.now();
    var dateString = DateFormat('dd-MM-yyyy').format(now);
    final String configFileName = 'lastConfig.$dateString.json';

    mockBookingService = BookingService(
        serviceName: 'CNG',
        serviceDuration: 20,
        bookingEnd: DateTime(now.year, now.month, now.day, 24, 0),
        bookingStart: DateTime(now.year, now.month, now.day, 1, 0));
  }

  Stream<dynamic>? getBookingStreamMock(
      {required DateTime end, required DateTime start}) {
    return Stream.value([]);
  }

  Future<dynamic> uploadBookingMock(
      {required BookingService newBooking}) async {
    await Future.delayed(const Duration(seconds: 1));
    converted.add(DateTimeRange(
        start: newBooking.bookingStart, end: newBooking.bookingEnd));
    print('${newBooking.toJson()} has been uploaded');
  }

  List<DateTimeRange> converted = [];

  List<DateTimeRange> convertStreamResultMock({required dynamic streamResult}) {
    ///here you can parse the streamresult and convert to [List<DateTimeRange>]
    ///take care this is only mock, so if you add today as disabledDays it will still be visible on the first load
    ///disabledDays will properly work with real data
    DateTime first = now;
    DateTime second = now.add(const Duration(minutes: 55));
    DateTime third = now.subtract(const Duration(minutes: 240));
    DateTime fourth = now.subtract(const Duration(minutes: 500));
    converted.add(
        DateTimeRange(start: first, end: now.add(const Duration(minutes: 30))));
    converted.add(DateTimeRange(
        start: second, end: second.add(const Duration(minutes: 23))));
    converted.add(DateTimeRange(
        start: third, end: third.add(const Duration(minutes: 15))));
    converted.add(DateTimeRange(
        start: fourth, end: fourth.add(const Duration(minutes: 50))));
    return converted;
  }

  List<DateTimeRange> generatePauseSlots() {
    return [
      DateTimeRange(
          start: DateTime(now.year, now.month, now.day, 12, 0),
          end: DateTime(now.year, now.month, now.day, 13, 0))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Booking CNG',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: MyTheme.appBarColor,
          title: const Text('Booking CNG slot'),
          centerTitle: true,
        ),
        body: Center(
          child: BookingCalendar(
            bookedSlotColor: Colors.red,
            availableSlotColor: Colors.green.shade500,
            selectedSlotColor: Colors.orange,
            bookingService: mockBookingService,
            convertStreamResultToDateTimeRanges: convertStreamResultMock,
            getBookingStream: getBookingStreamMock,
            uploadBooking: uploadBookingMock,
            pauseSlots: generatePauseSlots(),
            pauseSlotColor: Colors.grey.shade600,
            pauseSlotText: 'LUNCH',
            hideBreakTime: false,
            loadingWidget: const Text('Loading Data...'),
            uploadingWidget: const CircularProgressIndicator(),
            locale: 'English',
            startingDayOfWeek: StartingDayOfWeek.monday,
            disabledDays: const [],
          ),
        ),
      ),
    );
  }

  // Future<dynamic> uploadBookingFirebase(
  //     {required BookingService newBooking}) async {
  //   await bookings()
  //       .doc('your id, or autogenerate')
  //       .collection('bookings')
  //       .add(newBooking.toJson())
  //       .then((value) => print("Booking Added"))
  //       .catchError((error) => print("Failed to add booking: $error"));
  // }

  // bookings() {}
}
