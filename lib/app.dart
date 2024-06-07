import 'package:assignment_module_14/ui/screens/contact_list_screen.dart';
import 'package:flutter/material.dart';

class ContactListApp extends StatelessWidget {
  const ContactListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact List Screen',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade700,
          foregroundColor: Colors.white,
          centerTitle: true,
        )
      ),
      home: const ContactListScreen(),
    );
  }
}
