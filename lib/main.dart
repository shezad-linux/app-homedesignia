import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/core/local_storage/app_storage.dart';
import 'app/app.dart'; // Assuming this is your actual app widget

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();




  // Initialize local storage
  final appStorage = AppStorage();
  await appStorage.initAppStorage();

  runApp(
    ProviderScope(
      overrides: [
        appStorageProvider.overrideWithValue(appStorage),
      ],
      child: const App(), // Use the App widget defined in your app
    ),
  );
}
