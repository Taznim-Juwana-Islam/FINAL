import 'package:flutter_streams_lab/data/repository.dart'; // Import the Repository class
import 'package:flutter_riverpod/flutter_riverpod.dart';

final repositoryProvider = Provider<Repository>((ref) {
  return Repository();  // Ensure you're returning an instance of Repository
});
