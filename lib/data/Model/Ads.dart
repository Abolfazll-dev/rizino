class Ads {
  String link;
  String image;

  Ads(
    this.link,
    this.image,
  );

  factory Ads.fromMapJson(Map<String, dynamic> jsonMapObject) {
    return Ads(
      jsonMapObject['link'],
      'https://rizinoo.chbk.run/api/files/Ads/${jsonMapObject['id']}/${jsonMapObject['image']}',
    );
  }
}
