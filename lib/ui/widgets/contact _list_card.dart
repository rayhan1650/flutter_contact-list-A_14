import 'package:assignment_module_14/etinities/contact.dart';
import 'package:flutter/material.dart';

class ContactListCard extends StatelessWidget {
  const ContactListCard({
    super.key,
    required this.contact,
    required this.onLongPress,
  });
  final Contact contact;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: Card(
        elevation: 3,
        child: ListTile(
          leading: const CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text(contact.name),
          subtitle: Text(contact.number),
          trailing: const Icon(Icons.call),
        ),
      ),
    );
  }
}
