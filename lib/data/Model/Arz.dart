class Arz {
  String name;
  String image;



  Arz(
    this.name,
    this.image,


  );

  factory Arz.fromMapJson(Map<String, dynamic> jsonMapObject) {
    return Arz(
      jsonMapObject['name'],
      'https://rizinoo.chbk.run/api/files/cedarPrices/${jsonMapObject['id']}/${jsonMapObject['image']}',


    );
  }
}
