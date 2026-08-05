import 'package:flutter/material.dart';

class EmergencyContactsScreen extends StatelessWidget {
  const EmergencyContactsScreen({super.key});

  final List<Map<String, String>> contacts = const [
    {'name': 'Mother', 'phone': '+91 9876543210'},
    {'name': 'Father', 'phone': '+91 9123456780'},
    {'name': 'Brother', 'phone': '+91 9988776655'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Emergency Contacts')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];

          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red.shade100,
                child: const Icon(Icons.person, color: Colors.red),
              ),
              title: Text(contact['name']!),
              subtitle: Text(contact['phone']!),
              trailing: IconButton(
                icon: const Icon(Icons.call, color: Colors.green),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Calling ${contact['name']}...'),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
