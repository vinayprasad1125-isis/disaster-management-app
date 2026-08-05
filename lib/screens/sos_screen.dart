import 'package:flutter/material.dart';

class SOSScreen extends StatefulWidget {
  const SOSScreen({super.key});

  @override
  State<SOSScreen> createState() => _SOSScreenState();
}

class _SOSScreenState extends State<SOSScreen> {
  bool sosSent = false;

  void sendSOS() {
    setState(() {
      sosSent = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('🚨 SOS Alert Sent Successfully'),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Emergency SOS')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                sosSent ? Icons.check_circle : Icons.warning_amber_rounded,
                size: 120,
                color: sosSent ? Colors.green : Colors.red,
              ),
              const SizedBox(height: 24),
              Text(
                sosSent ? 'SOS SENT' : 'PRESS FOR EMERGENCY HELP',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'This will notify nearby responders and emergency contacts when connectivity is available.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(220, 60),
                ),
                onPressed: sendSOS,
                icon: const Icon(Icons.sos),
                label: const Text(
                  'SEND SOS',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 20),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.location_on),
                label: const Text('Share Live Location'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
