import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Models/event.dart';
import 'Screens/foryou.dart';
import 'Screens/trending.dart';
import 'package:provider/provider.dart';

import 'Services/database.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Center(
              child: Text('Something Went Wrong..'),
            );
          }
          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamProvider<List<Event>>.value(
              initialData: [],
              value: Database().readItems(),
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Events',
                theme: ThemeData(
                  primaryColor: Colors.white,
                  accentColor: Colors.green,
                ),
                home: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text('Southampton'),
                      centerTitle: true,
                      bottom: TabBar(
                        tabs: [
                          Tab(text: "FOR YOU"),
                          Tab(text: "TRENDING"),
                        ],
                      ),
                    ),
                    body: TabBarView(
                      children: [
                        ForYou(),
                        Trending(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return CircularProgressIndicator();
        });
  }
}
