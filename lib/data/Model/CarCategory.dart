class CarCategory {
  String name;
  String image;


  CarCategory(
    this.name,
    this.image,

  );

  factory CarCategory.fromMapJson(Map<String, dynamic> jsonObject) {
    return CarCategory(
      jsonObject['name'],

      'https://rizinoo.chbk.run/api/files/Category/${jsonObject['id']}/${jsonObject['image']}',
    );
  }
}
