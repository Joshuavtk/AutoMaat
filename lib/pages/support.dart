import 'package:auto_maat/ui/account_wrapper.dart';
import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return accountWrapper(context, 'Support', togglePadding: true, children: <Widget>[
      const Text(
        "How do I open the app?",
        style: TextStyle(fontSize: 18),
      ),
      const Text(
          "Simply tap on the app icon on your phone’s home screen. Make sure you are logged in to access all features."),
      const Divider(
        height: 20,
      ),
      const Text(
        "How do I create an account?",
        style: TextStyle(fontSize: 18),
      ),
      const Text(
          "Open the app and tap on \"Sign Up.\" Enter your details, follow the instructions, and verify your email or phone number."),
      const Divider(
        height: 20,
      ),
      const Text(
        "How do I book a car?",
        style: TextStyle(fontSize: 18),
      ),
      const Text(
          "Go to the \"Search\" section, enter your location and rental dates, choose a car, and follow the booking steps."),
      const Divider(
        height: 20,
      ),

      const Text(
        "How do I cancel a booking?",
        style: TextStyle(fontSize: 18),
      ),
      const Text("Go to \"My Bookings,\" select the booking you want to cancel, and tap \"Cancel Booking.\" Check the cancellation policy for any fees."),
      const Divider(
        height: 20,
      ),

      const Text(
        "How do I unlock my rental car?",
        style: TextStyle(fontSize: 18),
      ),
      const Text("If your rental supports keyless entry, go to the app, select your booking, and tap \"Unlock Car.\" Otherwise, collect the keys from the rental location."),
      const Divider(
        height: 20,
      ),

      const Text(
        "What should I do if the car has an issue?",
        style: TextStyle(fontSize: 18),
      ),
      const Text("Contact support through the app or call the emergency number provided in your booking confirmation."),
      const Divider(
        height: 20,
      ),

      const Text(
        "How do I return the car?",
        style: TextStyle(fontSize: 18),
      ),
      const Text("Follow the return instructions in your booking. Park at the designated location and lock the car using the app or return the keys."),
      const Divider(
        height: 20,
      ),

      const Text(
        "How do I contact customer support?",
        style: TextStyle(fontSize: 18),
      ),
      const Text("Go to the \"Help\" section in the app and choose chat, email, or phone support."),
      const Divider(
        height: 20,
      ),
    ]);
  }
}
