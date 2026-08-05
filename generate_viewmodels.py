import os

vm_dir = "lib/viewmodels"
os.makedirs(vm_dir, exist_ok=True)

files = {
    "auth_viewmodel.dart": """import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';
import '../core/providers/repository_providers.dart';

class AuthViewModel extends AsyncNotifier<User?> {
  @override
  FutureOr<User?> build() async {
    final repo = ref.read(authRepositoryProvider);
    final isLoggedIn = await repo.isLoggedIn();
    if (isLoggedIn) {
      // For mock purposes, just return a dummy if logged in, or null.
      return null;
    }
    return null;
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(authRepositoryProvider).login(email, password));
  }

  Future<void> loginAsGuest() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(authRepositoryProvider).loginAsGuest());
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    await ref.read(authRepositoryProvider).logout();
    state = const AsyncValue.data(null);
  }
}

final authViewModelProvider = AsyncNotifierProvider<AuthViewModel, User?>(() {
  return AuthViewModel();
});
""",
    "weather_viewmodel.dart": """import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/weather_model.dart';
import '../core/providers/repository_providers.dart';

class WeatherViewModel extends AsyncNotifier<Weather?> {
  @override
  FutureOr<Weather?> build() async {
    return ref.read(weatherRepositoryProvider).getCurrentWeather(0.0, 0.0);
  }

  Future<void> refreshWeather(double lat, double lng) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(weatherRepositoryProvider).getCurrentWeather(lat, lng));
  }
}

final weatherViewModelProvider = AsyncNotifierProvider<WeatherViewModel, Weather?>(() {
  return WeatherViewModel();
});
""",
    "alerts_viewmodel.dart": """import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/alert_model.dart';
import '../core/providers/repository_providers.dart';

class AlertsViewModel extends AsyncNotifier<List<Alert>> {
  @override
  FutureOr<List<Alert>> build() async {
    return ref.read(alertRepositoryProvider).getAlerts(0.0, 0.0);
  }

  Future<void> fetchAlerts(double lat, double lng) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(alertRepositoryProvider).getAlerts(lat, lng));
  }
}

final alertsViewModelProvider = AsyncNotifierProvider<AlertsViewModel, List<Alert>>(() {
  return AlertsViewModel();
});
""",
    "map_viewmodel.dart": """import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/map_marker_model.dart';
import '../core/providers/repository_providers.dart';

class MapViewModel extends AsyncNotifier<List<MapMarker>> {
  @override
  FutureOr<List<MapMarker>> build() async {
    return ref.read(mapRepositoryProvider).getMapMarkers(0.0, 0.0, 10.0);
  }

  Future<void> fetchMarkers(double lat, double lng, double radius) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(mapRepositoryProvider).getMapMarkers(lat, lng, radius));
  }
}

final mapViewModelProvider = AsyncNotifierProvider<MapViewModel, List<MapMarker>>(() {
  return MapViewModel();
});
""",
    "shelter_viewmodel.dart": """import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/shelter_model.dart';
import '../core/providers/repository_providers.dart';

class ShelterViewModel extends AsyncNotifier<List<Shelter>> {
  @override
  FutureOr<List<Shelter>> build() async {
    return ref.read(shelterRepositoryProvider).getNearbyShelters(0.0, 0.0);
  }

  Future<void> fetchNearbyShelters(double lat, double lng) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(shelterRepositoryProvider).getNearbyShelters(lat, lng));
  }
}

final shelterViewModelProvider = AsyncNotifierProvider<ShelterViewModel, List<Shelter>>(() {
  return ShelterViewModel();
});
""",
    "sos_viewmodel.dart": """import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/sos_model.dart';
import '../core/providers/repository_providers.dart';

class SOSViewModel extends AsyncNotifier<Sos?> {
  @override
  FutureOr<Sos?> build() async {
    return null;
  }

  Future<void> triggerSOS(Sos sosData) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(sosRepositoryProvider).triggerSOS(sosData));
  }

  Future<void> cancelSOS(String sosId) async {
    state = const AsyncValue.loading();
    await ref.read(sosRepositoryProvider).cancelSOS(sosId);
    state = const AsyncValue.data(null);
  }
}

final sosViewModelProvider = AsyncNotifierProvider<SOSViewModel, Sos?>(() {
  return SOSViewModel();
});
""",
    "profile_viewmodel.dart": """import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/profile_model.dart';
import '../core/providers/repository_providers.dart';

class ProfileViewModel extends AsyncNotifier<Profile?> {
  @override
  FutureOr<Profile?> build() async {
    return null;
  }

  Future<void> loadProfile(String userId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(profileRepositoryProvider).getProfile(userId));
  }

  Future<void> updateProfile(Profile profile) async {
    state = const AsyncValue.loading();
    await ref.read(profileRepositoryProvider).updateProfile(profile);
    state = AsyncValue.data(profile);
  }
}

final profileViewModelProvider = AsyncNotifierProvider<ProfileViewModel, Profile?>(() {
  return ProfileViewModel();
});
""",
    "settings_viewmodel.dart": """import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/settings_model.dart';
import '../core/providers/repository_providers.dart';

class SettingsViewModel extends AsyncNotifier<Settings?> {
  @override
  FutureOr<Settings?> build() async {
    return ref.read(settingsRepositoryProvider).getSettings();
  }

  Future<void> updateSettings(Settings settings) async {
    state = const AsyncValue.loading();
    await ref.read(settingsRepositoryProvider).saveSettings(settings);
    state = AsyncValue.data(settings);
  }
}

final settingsViewModelProvider = AsyncNotifierProvider<SettingsViewModel, Settings?>(() {
  return SettingsViewModel();
});
""",
    "chat_viewmodel.dart": """import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/ai_message_model.dart';
import '../core/providers/repository_providers.dart';

class ChatViewModel extends AsyncNotifier<List<AiMessage>> {
  @override
  FutureOr<List<AiMessage>> build() async {
    return [];
  }

  Future<void> sendMessage(String text) async {
    final prev = state.value ?? [];
    
    // Optimistic UI update for user message
    final userMsg = AiMessage(id: DateTime.now().toString(), text: text, isUser: true, timestamp: DateTime.now());
    state = AsyncValue.data([...prev, userMsg]);

    try {
      final aiResponse = await ref.read(aiRepositoryProvider).sendMessage(text);
      state = AsyncValue.data([...state.value!, aiResponse]);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final chatViewModelProvider = AsyncNotifierProvider<ChatViewModel, List<AiMessage>>(() {
  return ChatViewModel();
});
""",
    "offline_viewmodel.dart": """import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/offline_guide_model.dart';
import '../core/providers/repository_providers.dart';

class OfflineViewModel extends AsyncNotifier<List<OfflineGuide>> {
  @override
  FutureOr<List<OfflineGuide>> build() async {
    return ref.read(offlineRepositoryProvider).getOfflineGuides();
  }

  Future<void> downloadGuides(List<OfflineGuide> guides) async {
    state = const AsyncValue.loading();
    await ref.read(offlineRepositoryProvider).saveOfflineGuides(guides);
    state = await AsyncValue.guard(() => ref.read(offlineRepositoryProvider).getOfflineGuides());
  }
}

final offlineViewModelProvider = AsyncNotifierProvider<OfflineViewModel, List<OfflineGuide>>(() {
  return OfflineViewModel();
});
"""
}

for filename, content in files.items():
    with open(os.path.join(vm_dir, filename), "w") as f:
        f.write(content)
