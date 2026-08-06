class NearbyUser {
  final String id;
  final String name;
  final double distance;
  bool connected;

  NearbyUser({
    required this.id,
    required this.name,
    required this.distance,
    this.connected = false,
  });
}
