class ListCity {
  String value;
  String name;
  ListCity(this.value, this.name);

  static List<ListCity>getListCity(){
    return <ListCity>[
      ListCity('4.43889, -75.23222', 'Ibague'),
      ListCity('4.60971, -74.08175', 'Bogotá'),
      ListCity('4.142, -73.62664', 'Villavicencio'),
      ListCity('4.53389, -75.68111', 'Armenia'),
      ListCity('4.81333, -75.69611', 'Pereira'),
      ListCity('4.57937, -74.21682','Soacha')
    ];
  }

}


