import 'dart:convert';

// Function to convert PEM string to List<int>
List<int> pemToBytes(String pem) {
  final lines = pem.split('\n');
  final base64 = lines.where((line) => !line.startsWith('-----')).join();
  return base64Decode(base64);
}
