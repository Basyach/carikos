import 'package:coazykos/pages/splash_pages.dart';
import 'package:coazykos/providers/space_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>SpaceProvider(),
    child: MaterialApp(
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
      
      
    ),
    );
  }
}