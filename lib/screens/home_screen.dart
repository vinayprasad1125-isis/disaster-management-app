import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
Widget card(
  BuildContext context,
  IconData icon,
  String title,
  Color color,
  VoidCallback onTap,
) {
  return Card(
    child: InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 45, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}

    return Card(

      child: InkWell(

        onTap: () {},

        child: SizedBox(

          height: 130,

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
  card(
    context,
    Icons.sos,
    'Emergency SOS',
    Colors.red,
    () => Navigator.pushNamed(context, '/sos'),
  ),
  card(
    context,
    Icons.contact_phone,
    'Emergency Contacts',
    Colors.green,
    () => Navigator.pushNamed(context, '/contacts'),
  ),
  card(
    context,
    Icons.menu_book,
    'Offline Resources',
    Colors.blue,
    () => Navigator.pushNamed(context, '/resources'),
  ),
  card(context, Icons.chat, 'Offline Chat', Colors.orange, () {}),
  card(context, Icons.map, 'Disaster Map', Colors.teal, () {}),
  card(context, Icons.cloud, 'Weather', Colors.indigo, () {}),
],
            
