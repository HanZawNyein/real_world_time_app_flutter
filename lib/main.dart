import 'package:flutter/material.dart';

import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/home.dart';

void main() {
  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,
    // title: 'Named Routes Demo',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location': (context) => const ChooseLocation(),
    },
  ));
}
