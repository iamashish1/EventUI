class Event {
  String avatarImageUrl;
  String eventName;
  String eventLocation;
  List<dynamic> eventImages;
  String eventTime;
  String eventTitle;
  String price;
  Event(
      {required this.avatarImageUrl,
      required this.eventName,
      required this.eventLocation,
      required this.eventImages,
      required this.eventTime,
      required this.eventTitle,
      required this.price});
}
