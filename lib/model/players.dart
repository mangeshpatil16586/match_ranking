class Players {
  Players({
    required this.player_name,
    required this.position,
    required this.team,
    required this.points,
    required this.match_type,
    required this.player_type,
    required this.status
  });
  String player_name;
  int position;
  String team;
  int points;
  int match_type;
  int player_type;
  int status;

  factory Players.toJson(Map<String,dynamic> json){
    return Players(
        player_name: json?['player_name'],
        position: json?['position'],
        team: json?['team'],
        points: json?['points'],
        match_type: json?['match_type'],
        player_type: json?['player_type'],
        status: json?['status']
    );
  }
}
