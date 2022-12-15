class MatchType{
  MatchType({required this.team_name,
            required this.position,
            required this.points,
            required this.rating,
            required this.matches,
            required this.match_type,
            required this.status
    });

  String team_name;
  int position;
  int points;
  int rating;
  int matches;
  int match_type;
  int status;

  factory MatchType.toJson(Map<String,dynamic> json){
    return MatchType(
      team_name: json?['team_name'],
      position: json?['position'],
      points: json?['points'],
      rating: json?['rating'],
      matches: json?['matches'],
      match_type: json?['match_type'],
      status: json?['status']
    );
    }


}