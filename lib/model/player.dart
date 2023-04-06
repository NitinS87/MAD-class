class Player {
  String name = '';
  String country = '';

  Player(this.name, this.country);

  Player.fromJson(Map<String, dynamic> cricketData) {
    name = cricketData['data'][0]['name'];
    country = cricketData['data'][0]['country'] ?? '';
  }
}
