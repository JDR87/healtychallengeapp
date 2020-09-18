class Location {

  int id;
  String name;
  String latitude;
  String longitude;

  static const tblCity = 'locationes';
  static const colId = 'id';
  static const colName = 'name';
  static const colLat = 'latitude';
  static const colLon = 'longitude';

  Location({this.id, this.name, this.latitude, this.longitude});

  Location.fromMap(Map<String, dynamic> map){
    id = map[colId];
    name = map[colName];
    latitude = map[colLat];
    longitude = map[colLon];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colId: id,
      colName: name,
      colLat: latitude,
      colLon: longitude
    };
    if (id != null) map[colId] = id;
    return map;
  }


}