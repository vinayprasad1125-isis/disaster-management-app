abstract class DocumentLoader {
  Future<void> loadDocuments(String assetPath);
  String getContextForQuery(String query);
}
