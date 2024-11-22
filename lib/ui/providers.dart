import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_streams_lab/data/repository.dart'; // Adjust import as needed

// Define the repository provider
final repositoryProvider = Provider<Repository>((ref) {
  return Repository();  // Assuming you have a Repository class
});
