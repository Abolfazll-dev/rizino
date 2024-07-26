class Arz {
  String min;
  String max;
  String current;


  Arz(
    this.min,
    this.max,
    this.current,

  );

  factory Arz.fromMapJson(Map<String, dynamic> jsonMapObject) {
    return Arz(
      jsonMapObject['min'],
      jsonMapObject['max'],
      jsonMapObject['current'],

    );
  }
}
