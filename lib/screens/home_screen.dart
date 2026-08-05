import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget card(
      BuildContext context,
      IconData icon,
      String title,
      Color color,
      ) {

    return Card(

      child: InkWell(

        onTap: () {},

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
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Disaster Dashboard"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(15),

        child: GridView.count(

          crossAxisCount: 2,

          crossAxisSpacing: 12,

          mainAxisSpacing: 12,

          children: [

            card(context, Icons.sos, "Emergency SOS", Colors.red),

            card(context, Icons.chat, "Offline Chat", Colors.orange),

            card(context, Icons.map, "Disaster Map", Colors.blue),

            card(context, Icons.cloud, "Weather", Colors.green),

            card(context, Icons.report, "Report Disaster", Colors.deepOrange),

            card(context, Icons.psychology, "AI Assistant", Colors.purple),

            card(context, Icons.home, "Shelters", Colors.teal),

            card(context, Icons.person, "Profile", Colors.indigo),

          ],
        ),
      ),
    );
  }
}
