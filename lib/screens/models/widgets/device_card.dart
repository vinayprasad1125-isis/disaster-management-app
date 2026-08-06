import 'package:flutter/material.dart';
import '../models/nearby_user.dart';

class DeviceCard extends StatelessWidget {
  final NearbyUser user;
  final VoidCallback onConnect;

  const DeviceCard({
    super.key,
    required this.user,
    required this.onConnect,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: user.connected
              ? Colors.green
              : Colors.orange,
          child: Icon(
            user.connected
                ? Icons.bluetooth_connected
                : Icons.bluetooth_searching,
            color: Colors.white,
          ),
        ),
        title: Text(user.name),
        subtitle: Text(
          "${user.distance.toStringAsFixed(1)} meters away",
        ),
        trailing: ElevatedButton(
          onPressed: onConnect,
          style: ElevatedButton.styleFrom(
            backgroundColor:
                user.connected
                    ? Colors.green
                    : Colors.red,
          ),
          child: Text(
            user.connected
                ? "Connected"
                : "Connect",
          ),
        ),
      ),
    );
  }
}
