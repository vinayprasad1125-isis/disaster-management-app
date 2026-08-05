import 'package:flutter/material.dart';

class OfflineResourcesScreen extends StatelessWidget {
  const OfflineResourcesScreen({super.key});

  final List<Map<String, String>> resources = const [
    {
      'title': 'Earthquake Safety',
      'desc': 'Drop, Cover, and Hold On. Stay away from windows.'
    },
    {
      'title': 'Flood Safety',
      'desc': 'Move to higher ground immediately. Avoid flood water.'
    },
    {
      'title': 'Cyclone Preparedness',
      'desc': 'Stay indoors and keep emergency supplies ready.'
    },
    {
      'title': 'Emergency Kit Checklist',
      'desc': 'Water, food, flashlight, medicines, power bank, documents.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Offline Resources')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: resources.length,
        itemBuilder: (context, index) {
          final item = resources[index];

          return Card(
            child: ListTile(
              leading: const Icon(Icons.menu_book, color: Colors.blue),
              title: Text(
                item['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(item['desc']!),
            ),
          );
        },
      ),
    );
  }
}
