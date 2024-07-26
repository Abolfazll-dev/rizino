class BannerCampain {
  String id;
  String image;

  BannerCampain(
    this.id,
    this.image,
  );

  factory BannerCampain.fromMapJson(Map<String, dynamic> jsonObject) {
    return BannerCampain(
      jsonObject['id'],
      'https://rizinoo.chbk.run/api/files/CategoryImage/${jsonObject['id']}/${jsonObject['image']}',
    );
  }
}
