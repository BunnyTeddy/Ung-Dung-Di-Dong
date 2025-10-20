import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'services/firebase/firebase_service.dart';
import 'providers/auth_provider.dart';
import 'providers/plant_provider.dart';
import 'providers/diary_provider.dart';
import 'providers/iot_provider.dart';
import 'providers/notification_provider.dart';
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
  
  // Initialize Firebase
  await FirebaseService.initialize();
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => PlantProvider()),
        ChangeNotifierProvider(create: (_) => DiaryProvider()),
        ChangeNotifierProvider(create: (_) => IotProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
      ],
      child: const PlantCareApp(),
    ),
  );
}

