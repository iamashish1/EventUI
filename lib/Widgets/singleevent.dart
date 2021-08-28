import 'package:eventui/Helpers/screensize.dart';
import 'package:eventui/Models/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_pro/carousel_pro.dart';

class SingleEvent extends StatelessWidget {
  final Event event;
  SingleEvent(this.event);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      height: screenHeight(context, dividedBy: 1.8),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            height: screenHeight(context, dividedBy: 5),
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(event.avatarImageUrl),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 7),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Text(
                                  event.eventName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          screenWidth(context, dividedBy: 26)),
                                ),
                                Icon(
                                  Icons.verified_user,
                                  color: Colors.green,
                                  size: screenWidth(context, dividedBy: 20),
                                )
                              ]),
                              Row(children: [
                                Icon(
                                  Icons.place_outlined,
                                  color: Colors.grey,
                                  size: screenWidth(context, dividedBy: 20),
                                ),
                                Text(
                                  event.eventLocation,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize:
                                          screenWidth(context, dividedBy: 26)),
                                ),
                              ])
                            ]),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.more_horiz_outlined),
              ],
            ),
          ),
          //Following is the container that contains Multiple Images of the event
          ImageSection(event),
          DescTime(event),
        ],
      ),
    );
  }
}

class DescTime extends StatelessWidget {
  final Event event;
  DescTime(this.event);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 2),
            child: Text(
              event.eventTime,
              style: TextStyle(
                fontSize: screenWidth(context, dividedBy: 34),
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
          Container(
              width: double.infinity,
              child: Text(
                event.eventTitle,
                style: TextStyle(
                    fontSize: screenWidth(context, dividedBy: 20),
                    fontWeight: FontWeight.bold),
              )),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(event.price + '\$'),
                Text(
                  '62% Match',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  final Event event;
  ImageSection(this.event);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: new BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          height: screenHeight(context, dividedBy: 3.4),
          child: Carousel(
            dotBgColor: Colors.transparent,
            dotSize: 3.0,
            dotSpacing: 10,
            images: [
              Image.network(
                event.eventImages[0],
                fit: BoxFit.cover,
              ),
              Image.network(
                event.eventImages[1],
                fit: BoxFit.cover,
              ),
              Image.network(
                event.eventImages[2],
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.favorite_border_outlined, color: Colors.white),
          ),
        )
      ],
    );
  }
}
