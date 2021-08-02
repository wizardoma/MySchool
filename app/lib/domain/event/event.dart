class Event {
  final String id;
  final String name;
  final String date;
  final String location;
  final String price;
  final String imageUrl;
  final int noOfGoings;
  final String organizer;
  final String description;

  Event({
    this.noOfGoings,
    this.id,
    this.name,
    this.date,
    this.location,
    this.price,
    this.imageUrl,
    this.organizer,
    this.description,
  });
}
