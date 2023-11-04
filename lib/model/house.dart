class House {
  var id;
  var imageBase64;
  var location;
  var description;
  var price;
  var bedroomCount;
  var totalRoomCount;
  var ownerId;
  var sqFeet;

  House({
    required this.id,
    required this.imageBase64,
    required this.location,
    required this.description,
    required this.price,
    required this.totalRoomCount,
    required this.bedroomCount,
    required this.ownerId,
    required this.sqFeet,
  });
}
