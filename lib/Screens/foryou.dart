import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventui/Models/event.dart';
import 'package:eventui/Widgets/singleevent.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForYou extends StatefulWidget {
  @override
  _ForYouState createState() => _ForYouState();
}

class _ForYouState extends State<ForYou> {
  @override
  Widget build(BuildContext context) {
    final events = Provider.of<List<Event>>(context);

    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) => SingleEvent(events[index]),
    );
  }
}
