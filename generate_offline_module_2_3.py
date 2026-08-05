import os

base_dir = "lib/features/offline_communication"
repos_dir = os.path.join(base_dir, "data/repositories")
providers_dir = os.path.join(base_dir, "presentation/providers")
screens_dir = os.path.join(base_dir, "presentation/screens")
widgets_dir = os.path.join(base_dir, "presentation/widgets")

os.makedirs(repos_dir, exist_ok=True)
os.makedirs(providers_dir, exist_ok=True)
os.makedirs(screens_dir, exist_ok=True)
os.makedirs(widgets_dir, exist_ok=True)

# 1. MOCK REPOSITORY
mock_repo_content = """import 'dart:async';
import '../../../../core/constants/asset_constants.dart';
import '../../data/models/nearby_device.dart';
import '../../data/models/emergency_message.dart';
import '../../data/models/communication_session.dart';
import '../../data/models/communication_enums.dart';
import '../../domain/repositories/communication_repository.dart';

class MockCommunicationRepository implements CommunicationRepository {
  final List<NearbyDevice> _mockDevices = [
    const NearbyDevice(
      id: 'dev_1',
      name: 'John Doe',
      avatarUrl: AssetConstants.placeholderAvatar,
      approximateDistanceMeters: 15.0,
      connectionType: ConnectionType.bluetooth,
      signalStrength: SignalStrength.good,
      status: ConnectionStatus.disconnected,
    ),
    const NearbyDevice(
      id: 'dev_2',
      name: 'Sarah Smith',
      avatarUrl: AssetConstants.placeholderAvatar,
      approximateDistanceMeters: 5.0,
      connectionType: ConnectionType.wifiDirect,
      signalStrength: SignalStrength.excellent,
      status: ConnectionStatus.connected,
    ),
    const NearbyDevice(
      id: 'dev_3',
      name: 'Neighbor Mike',
      avatarUrl: AssetConstants.placeholderAvatar,
      approximateDistanceMeters: 45.0,
      connectionType: ConnectionType.bluetooth,
      signalStrength: SignalStrength.weak,
      status: ConnectionStatus.disconnected,
    ),
  ];

  @override
  Stream<List<NearbyDevice>> scanForDevices() async* {
    yield [];
    await Future.delayed(const Duration(seconds: 2));
    yield [_mockDevices[0]];
    await Future.delayed(const Duration(seconds: 2));
    yield [_mockDevices[0], _mockDevices[1]];
    await Future.delayed(const Duration(seconds: 1));
    yield _mockDevices;
  }

  @override
  Future<void> stopScanning() async {
    // Mock stop
  }

  @override
  Future<bool> connectToDevice(String deviceId) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  @override
  Future<void> disconnectFromDevice(String deviceId) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<EmergencyMessage> sendMessage(EmergencyMessage message) async {
    await Future.delayed(const Duration(milliseconds: 800));
    return message.copyWith(status: MessageDeliveryStatus.delivered);
  }

  @override
  Stream<EmergencyMessage> receiveMessages(String deviceId) async* {
    // Mock incoming message
    await Future.delayed(const Duration(seconds: 5));
    yield EmergencyMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: 'Are you okay? I have water.',
      senderId: deviceId,
      receiverId: 'me',
      timestamp: DateTime.now(),
      status: MessageDeliveryStatus.delivered,
    );
  }

  @override
  Future<CommunicationSession> initiateCall(String deviceId) async {
    await Future.delayed(const Duration(seconds: 2));
    final device = _mockDevices.firstWhere((d) => d.id == deviceId);
    return CommunicationSession(
      sessionId: DateTime.now().millisecondsSinceEpoch.toString(),
      peerDevice: device,
      startTime: DateTime.now(),
      callState: CallState.active,
    );
  }

  @override
  Stream<CommunicationSession> incomingCalls() async* {
    // Simulate incoming call after a while
    await Future.delayed(const Duration(seconds: 15));
    yield CommunicationSession(
      sessionId: 'inc_call_1',
      peerDevice: _mockDevices[2],
      startTime: DateTime.now(),
      callState: CallState.incoming,
    );
  }

  @override
  Future<void> endCall(String sessionId) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
"""

with open(os.path.join(repos_dir, "mock_communication_repository.dart"), "w") as f:
    f.write(mock_repo_content)


# 2. PROVIDERS
providers_content = """import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/mock_communication_repository.dart';
import '../../domain/repositories/communication_repository.dart';
import '../../data/models/nearby_device.dart';
import '../../data/models/communication_enums.dart';

final communicationRepositoryProvider = Provider<CommunicationRepository>((ref) {
  return MockCommunicationRepository();
});

final nearbyDevicesProvider = StreamProvider<List<NearbyDevice>>((ref) {
  final repo = ref.watch(communicationRepositoryProvider);
  return repo.scanForDevices();
});

// A provider to manage the connection state for a specific device
final connectionStateProvider = StateProvider.family<ConnectionStatus, String>((ref, deviceId) {
  // Hardcoded for mock purpose: dev_2 is already connected.
  if (deviceId == 'dev_2') return ConnectionStatus.connected;
  return ConnectionStatus.disconnected;
});

// A notifier to manage connecting logic
class ConnectionNotifier extends StateNotifier<void> {
  final Ref ref;
  ConnectionNotifier(this.ref) : super(null);

  Future<void> connect(String deviceId) async {
    ref.read(connectionStateProvider(deviceId).notifier).state = ConnectionStatus.connecting;
    final repo = ref.read(communicationRepositoryProvider);
    final success = await repo.connectToDevice(deviceId);
    ref.read(connectionStateProvider(deviceId).notifier).state = 
        success ? ConnectionStatus.connected : ConnectionStatus.failed;
  }
  
  Future<void> disconnect(String deviceId) async {
    final repo = ref.read(communicationRepositoryProvider);
    await repo.disconnectFromDevice(deviceId);
    ref.read(connectionStateProvider(deviceId).notifier).state = ConnectionStatus.disconnected;
  }
}

final connectionNotifierProvider = Provider((ref) => ConnectionNotifier(ref));
"""

with open(os.path.join(providers_dir, "offline_communication_providers.dart"), "w") as f:
    f.write(providers_content)


# 3. OFFLINE HOME SCREEN
home_content = """import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/app_routes.dart';

class OfflineCommunicationHome extends StatelessWidget {
  const OfflineCommunicationHome({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offline Emergency'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.wifi_off_rounded,
              size: 100,
              color: colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text(
              'No Cellular or Internet?',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Use Bluetooth and Wi-Fi Direct to communicate with nearby users in the mesh network. Range is approximately 100 meters.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            ElevatedButton.icon(
              onPressed: () {
                context.push(AppRoutes.nearbyDevices);
              },
              icon: const Icon(Icons.radar_rounded),
              label: const Text('Scan for Nearby Devices'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),
            Text(
              'Recent Connections',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: const Text('Sarah Smith'),
              subtitle: const Text('Last seen 5 mins ago'),
              trailing: IconButton(
                icon: const Icon(Icons.chat_bubble_outline),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
"""

with open(os.path.join(screens_dir, "offline_communication_home.dart"), "w") as f:
    f.write(home_content)


# 4. NEARBY DEVICES SCREEN
nearby_content = """import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/offline_communication_providers.dart';
import '../widgets/device_card.dart';

class NearbyDevicesScreen extends ConsumerWidget {
  const NearbyDevicesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devicesAsync = ref.watch(nearbyDevicesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Devices'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(nearbyDevicesProvider);
            },
          ),
        ],
      ),
      body: devicesAsync.when(
        data: (devices) {
          if (devices.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 24),
                  Text('Scanning for mesh nodes...'),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: devices.length,
            itemBuilder: (context, index) {
              return DeviceCard(device: devices[index]);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
"""

with open(os.path.join(screens_dir, "nearby_devices_screen.dart"), "w") as f:
    f.write(nearby_content)


# 5. DEVICE CARD WIDGET
device_card_content = """import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/nearby_device.dart';
import '../../data/models/communication_enums.dart';
import '../providers/offline_communication_providers.dart';

class DeviceCard extends ConsumerWidget {
  final NearbyDevice device;

  const DeviceCard({super.key, required this.device});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final connectionStatus = ref.watch(connectionStateProvider(device.id));
    final notifier = ref.read(connectionNotifierProvider);

    IconData typeIcon = device.connectionType == ConnectionType.bluetooth 
        ? Icons.bluetooth 
        : Icons.wifi_find;
        
    IconData signalIcon = Icons.signal_cellular_alt_1_bar;
    switch (device.signalStrength) {
      case SignalStrength.weak:
        signalIcon = Icons.signal_cellular_alt_1_bar;
        break;
      case SignalStrength.fair:
        signalIcon = Icons.signal_cellular_alt_2_bar;
        break;
      case SignalStrength.good:
        signalIcon = Icons.signal_cellular_alt;
        break;
      case SignalStrength.excellent:
        signalIcon = Icons.signal_wifi_4_bar;
        break;
    }

    Widget trailingWidget;
    switch (connectionStatus) {
      case ConnectionStatus.disconnected:
      case ConnectionStatus.failed:
        trailingWidget = ElevatedButton(
          onPressed: () => notifier.connect(device.id),
          child: const Text('Connect'),
        );
        break;
      case ConnectionStatus.connecting:
        trailingWidget = const SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(strokeWidth: 2),
        );
        break;
      case ConnectionStatus.connected:
        trailingWidget = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.call, color: colorScheme.primary),
              onPressed: () {
                // Navigate to call
              },
            ),
            IconButton(
              icon: Icon(Icons.message, color: colorScheme.secondary),
              onPressed: () {
                // Navigate to chat
              },
            ),
          ],
        );
        break;
    }

    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: colorScheme.primaryContainer,
              child: Icon(Icons.person, color: colorScheme.onPrimaryContainer),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    device.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(typeIcon, size: 14, color: colorScheme.onSurfaceVariant),
                      const SizedBox(width: 4),
                      Text(
                        '~${device.approximateDistanceMeters.toInt()}m',
                        style: TextStyle(fontSize: 12, color: colorScheme.onSurfaceVariant),
                      ),
                      const SizedBox(width: 12),
                      Icon(signalIcon, size: 14, color: colorScheme.primary),
                    ],
                  ),
                ],
              ),
            ),
            trailingWidget,
          ],
        ),
      ),
    );
  }
}
"""

with open(os.path.join(widgets_dir, "device_card.dart"), "w") as f:
    f.write(device_card_content)
