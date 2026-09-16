import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../domain/models/offline_ai_models.dart';

class OfflineKnowledgeBase {
  final Map<String, KnowledgeDocument> _documents = {};
  bool _isLoaded = false;

  final List<String> _manualFiles = [
    'first_aid.json',
    'earthquake_prep.json',
    'earthquake_during.json',
    'earthquake_after.json',
    'earthquake_facts.json',
    'flood.json',
    'cyclone.json',
    'fire.json',
    'landslide.json',
    'survival.json',
    'emergency_contacts.json',
  ];

  Future<void> initialize() async {
    if (_isLoaded) return;
    try {
      for (var file in _manualFiles) {
        final jsonString = await rootBundle.loadString('assets/offline_manuals/$file');
        final data = json.decode(jsonString) as Map<String, dynamic>;
        
        final doc = KnowledgeDocument.fromJson(data);
        _documents[doc.id] = doc;
      }
      _isLoaded = true;
    } catch (e) {
      throw Exception('Failed to load offline manuals: $e');
    }
  }

  Future<KnowledgeDocument?> searchRelevantDocument(String query) async {
    if (!_isLoaded) await initialize();
    
    final queryTokens = query.toLowerCase().split(' ');
    
    KnowledgeDocument? bestMatch;
    int maxMatches = 0;

    for (var doc in _documents.values) {
      int matches = 0;
      final docText = doc.content.toLowerCase();
      
      for (var token in queryTokens) {
        if (token.length > 3 && docText.contains(token)) {
          matches++;
        }
      }

      if (matches > maxMatches) {
        maxMatches = matches;
        bestMatch = doc;
      }
    }

    return bestMatch;
  }
}
