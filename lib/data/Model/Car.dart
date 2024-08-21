class Car {
  String name;
  String collectionId;
  String model;
  String price;
  String azad;
  String popularity;
  String image;

  Car(
    this.name,
    this.collectionId,
    this.model,
    this.price,
    this.azad,
    this.popularity,
    this.image,
  );

  factory Car.fromMapJson(Map<String, dynamic> jsonObject) {
    return Car(
      jsonObject['name'],
      jsonObject['collectionId'],
      jsonObject['model'],
      jsonObject['price'],
      jsonObject['azad'],
      jsonObject['popularity'],
      'https://rizinoo.chbk.run/api/files/carPrice/${jsonObject['id']}/${jsonObject['image']}',
    );
  }
}
