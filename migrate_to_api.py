import os
import glob
import re

mock_dir = "lib/repositories/mock"
api_dir = "lib/repositories/api"
providers_file = "lib/core/providers/repository_providers.dart"

os.makedirs(api_dir, exist_ok=True)

# 1. Copy and rename Mock to Api
mock_files = glob.glob(os.path.join(mock_dir, "mock_*.dart"))
for mock_file in mock_files:
    filename = os.path.basename(mock_file)
    api_filename = filename.replace("mock_", "api_")
    api_filepath = os.path.join(api_dir, api_filename)
    
    with open(mock_file, "r") as f:
        content = f.read()
        
    # Replace Mock with Api
    content = content.replace("class Mock", "class Api")
    # Replace mock_ with api_ in any imports (unlikely but safe)
    content = content.replace("mock_", "api_")
    
    with open(api_filepath, "w") as f:
        f.write(content)

# 2. Update providers
with open(providers_file, "r") as f:
    providers_content = f.read()

# Replace imports
providers_content = providers_content.replace("import '../../repositories/mock/mock_", "import '../../repositories/api/api_")
# Replace instantiations
providers_content = providers_content.replace("=> Mock", "=> Api")

with open(providers_file, "w") as f:
    f.write(providers_content)

# 3. Generate ApiClient
api_client_code = """import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class ApiClient {
  static const String baseUrl = 'http://127.0.0.1:3000/api';

  Future<Map<String, String>> _getHeaders() async {
    final user = FirebaseAuth.instance.currentUser;
    String? token;
    if (user != null) {
      token = await user.getIdToken();
    }
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  Future<dynamic> get(String endpoint) async {
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: await _getHeaders(),
    );
    return _handleResponse(response);
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: await _getHeaders(),
      body: jsonEncode(data),
    );
    return _handleResponse(response);
  }
  
  Future<dynamic> put(String endpoint, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: await _getHeaders(),
      body: jsonEncode(data),
    );
    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception('API Error: ${response.statusCode} - ${response.body}');
    }
  }
}

final apiClient = ApiClient();
"""
os.makedirs("lib/core/api", exist_ok=True)
with open("lib/core/api/api_client.dart", "w") as f:
    f.write(api_client_code)

print("Migration from Mock to API completed!")
