
class SocketResponse {
  int? gameId;
  String? gameStatus;
  int? timeRemaining;

  SocketResponse({this.gameId, this.gameStatus, this.timeRemaining});

  SocketResponse.fromJson(Map<String, dynamic> json) {
    gameId = json["game_id"];
    gameStatus = json["game_status"];
    timeRemaining = json["time_remaining"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["game_id"] = gameId;
    _data["game_status"] = gameStatus;
    _data["time_remaining"] = timeRemaining;
    return _data;
  }
}