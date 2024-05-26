
class GameListResponse {
  int? statusCode;
  String? message;
  List<GameData>? data;
  String? errorCode;
  String? errorMessage;

  GameListResponse({this.statusCode, this.message, this.data, this.errorCode, this.errorMessage});

  GameListResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json["statusCode"];
    message = json["message"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => GameData.fromJson(e)).toList();
    errorCode = json["errorCode"];
    errorMessage = json["errorMessage"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["statusCode"] = statusCode;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["errorCode"] = errorCode;
    _data["errorMessage"] = errorMessage;
    return _data;
  }
}

class GameData {
  int? gameId;
  String? gameTitle;
  String? gameThumbnail;
  String? gameBackgroundImage;
  double? gameStartingPrice;
  String? gameStatus;
  int? gameDurationSeconds;
  int? gameFreezeSeconds;
  int? gameCategoryId;
  String? gameSecondaryBackgroundImage;
  double? gameMaxPrice;
  int? gameNotPlayed;

  GameData({this.gameId, this.gameTitle, this.gameThumbnail, this.gameBackgroundImage, this.gameStartingPrice, this.gameStatus, this.gameDurationSeconds, this.gameFreezeSeconds, this.gameCategoryId, this.gameSecondaryBackgroundImage, this.gameMaxPrice, this.gameNotPlayed});

  GameData.fromJson(Map<String, dynamic> json) {
    gameId = json["game_id"];
    gameTitle = json["game_title"];
    gameThumbnail = json["game_thumbnail"];
    gameBackgroundImage = json["game_background_image"];
    gameStartingPrice = json["game_starting_price"];
    gameStatus = json["game_status"];
    gameDurationSeconds = json["game_duration_seconds"];
    gameFreezeSeconds = json["game_freeze_seconds"];
    gameCategoryId = json["game_category_id"];
    gameSecondaryBackgroundImage = json["game_secondary_background_image"];
    gameMaxPrice = json["game_max_price"];
    gameNotPlayed = json["game_not_played"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["game_id"] = gameId;
    _data["game_title"] = gameTitle;
    _data["game_thumbnail"] = gameThumbnail;
    _data["game_background_image"] = gameBackgroundImage;
    _data["game_starting_price"] = gameStartingPrice;
    _data["game_status"] = gameStatus;
    _data["game_duration_seconds"] = gameDurationSeconds;
    _data["game_freeze_seconds"] = gameFreezeSeconds;
    _data["game_category_id"] = gameCategoryId;
    _data["game_secondary_background_image"] = gameSecondaryBackgroundImage;
    _data["game_max_price"] = gameMaxPrice;
    _data["game_not_played"] = gameNotPlayed;
    return _data;
  }
}