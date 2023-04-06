class MatchInfo {
  String name = '';
  String matchType = '';
  String status = '';
  String venue = '';
  List teams = [];
  List score = [];
  String winner = '';
  String tossWinner = '';
  String date = '';

  MatchInfo(this.name, this.matchType, this.status, this.venue, this.teams,
      this.score, this.winner, this.tossWinner, this.date);

  MatchInfo.fromJson(Map<String, dynamic> cricketData) {
    name = cricketData['data']['name'];
    matchType = cricketData['data']['matchType'] ?? '';
    status = cricketData['data']['status'] ?? '';
    venue = cricketData['data']['venue'] ?? '';
    date = cricketData['data']['date'] ?? '';
    teams = cricketData['data']['teamInfo'] ?? '';
    score = cricketData['data']['score'] ?? '';
    score = cricketData['data']['tossWinner'] ?? '';
  }
}
