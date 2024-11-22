class CricketMatch{
  final String TeamOne;
  final String TeamTwo;
  final int TeamOneScore;
  final int TeamTwoScore;
  final String WinnerTeam;
  final bool isMatchRunning;

  CricketMatch({
    required this.TeamOne,
    required this.TeamTwo,
    required this.TeamOneScore,
    required this.TeamTwoScore,
    required this.WinnerTeam,
    required this.isMatchRunning
  });
  factory CricketMatch.fromJson(Map<String, dynamic>json){
    return CricketMatch(
        TeamOne: json["TeamOne"],
        TeamTwo: json["TeamTwo"],
        TeamOneScore: json["TeamOneScore"],
        TeamTwoScore: json["TeamTwoScore"],
        WinnerTeam: json['WinnerTeam'],
        isMatchRunning: json['isMatchRunning'],
    );
  }
  Map<String, dynamic>toJon(){
    return {
      "TeamOne": TeamOne,
      "TeamTwo": TeamTwo,
      "TeamOneScore": TeamOneScore,
      "TeamTwoScore" : TeamTwoScore,
      "WinnerTeam" : WinnerTeam,
      "isMatchRunning" : isMatchRunning,
    };
}
}