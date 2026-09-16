import 'package:flutter_riverpod/flutter_riverpod.dart';

// Since we asked for audio provider as well, we'll keep it simple here.
// Most logic is in WalkieTalkieProvider. This can just be for generic audio settings if needed.
final audioSettingsProvider = StateProvider<bool>((ref) => true); // e.g., speaker on/off
