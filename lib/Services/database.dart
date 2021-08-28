import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventui/Models/event.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _eventsCollection = _firestore.collection('events');

class Database {
  Stream<List<Event>> readItems() {
    var event = _eventsCollection.limit(2).snapshots();
    return event.map(eventList);
  }

  List<Event> eventList(QuerySnapshot snapshot) {
    var lis = snapshot.docs.map((e) {
      return Event(
        avatarImageUrl: e.get('avatarImageUrl'),
        eventImages: e.get('eventImages').toList(),
        eventLocation: e.get('eventLocation'),
        eventName: e.get('eventName'),
        eventTime: e.get('eventTime'),
        price: e.get('price'),
        eventTitle: e.get('eventTitle'),
      );
    }).toList();

    return lis;
  }
}
