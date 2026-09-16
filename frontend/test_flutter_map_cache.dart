import 'package:flutter_map_cache/flutter_map_cache.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
void main() {
  final provider = CachedTileProvider(
    store: MemCacheStore(), 
  );
}
