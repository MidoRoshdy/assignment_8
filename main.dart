import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/screens/contact/contact_screen.dart';
import 'package:whatsapp/screens/contact/provider/ContactProvider.dart';
import 'package:whatsapp/screens/home_screen/home_screen.dart';
import 'package:whatsapp/screens/home_screen/search_screen/search_screen.dart';
import 'package:whatsapp/screens/splash_screen/splash_screen.dart';
import 'package:whatsapp/screens/story/provider/story_providr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<ContactProvider>(create: (_) => ContactProvider()),
        ListenableProvider<Storyprovider>(create: (_) => Storyprovider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Whats app',
        theme: ThemeData.light(),
        routes: {
          "/": (context) => SplashScreen(),
          "home_screen": (context) => HomeScreen(),
          "search": (_) => SearchScreen(),
          "contact_screen": (context) => ContactScreen(),
        },
      ),
    );
  }
}
