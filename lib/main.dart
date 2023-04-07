// ignore_for_file: depend_on_referenced_packages

import 'package:cosmofly/logic/logic_provider.dart';
import 'package:cosmofly/logic/song_provider.dart';
import 'package:flutter/material.dart';
import 'route.dart' as route;
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  OnboardingProvider onboardingProvider = OnboardingProvider();
  onboardingProvider.loadStateFromStorage();

  final PermissionStatus permissionStatus = await Permission.storage.request();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => OnboardingProvider()),
    ChangeNotifierProvider(create: (context) => SongProvider()),
    ChangeNotifierProvider(create: (context) => SongList()),
    ChangeNotifierProvider<SongList>(create: (context) => SongList()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cosmo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: route.generateMainRoute,
      initialRoute: route.splashPage,
    );
  }
}
