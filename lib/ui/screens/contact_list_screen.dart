import 'package:flutter/material.dart';
import '../../etinities/contact.dart';
import '../widgets/contact _list_card.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _numberTEController = TextEditingController();
  final List<Contact> _contactList = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print(_contactList);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                controller: _nameTEController,
                decoration: InputDecoration(
                    hintText: 'Name',
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _numberTEController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Number',
                    labelText: 'Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {});
                      _contactList.add(Contact(
                          name: _nameTEController.text,
                          number: _numberTEController.text));
                      _clearTextField();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade700,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.maxFinite, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: const Text('Add')),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                    itemCount: _contactList.length,
                    itemBuilder: (context, index) {
                      return ContactListCard(
                        contact: _contactList[index],
                        onLongPress: () {
                          _deleteDialog(context, index);
                        },
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _deleteDialog(BuildContext context, int index) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text(
            'Are you sure for Delete',
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.cancel_presentation)),
            IconButton(
                onPressed: () {
                  _contactList.removeAt(index);
                  Navigator.pop(context);
                  setState(() {});
                },
                icon: const Icon(Icons.delete)),
          ],
        );
      },
    );
  }

  _clearTextField() {
    _nameTEController.clear();
    _numberTEController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    _nameTEController.dispose();
    _numberTEController.dispose();
  }
}
