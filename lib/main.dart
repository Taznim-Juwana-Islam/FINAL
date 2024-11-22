import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_streams_lab/ui/bookmarks/bookmarks.dart'; // Import the BookmarksScreen
import 'package:flutter_streams_lab/ui/groceries/groceries.dart'; // Import the GroceriesScreen

void main() {
  runApp(ProviderScope(child: MyApp())); // Use ProviderScope for Riverpod
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Streams App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BookmarksScreen(),  // Set the BookmarksScreen as the home screen
    );
  }
}
