import 'dart:async';

import 'package:match_ranking/model/match_type.dart';

import '../../model/players.dart';

class HomePageViewModel implements HomePageInput,HomePageOutput{
  StreamController<List<Players>> _playersStreamController=StreamController<List<Players>>.broadcast();
  StreamController<List<MatchType>> _matchTypeStreamController=StreamController<List<MatchType>>.broadcast();
  StreamController<bool> _playerOrMatchStreamController=StreamController<bool>.broadcast();

  @override
  Sink get inputPlayerList => _playersStreamController.sink;

  @override
  Sink get inputMatchList => _matchTypeStreamController.sink;

  @override
  Stream<List<Players>> get outputPlayerList => _playersStreamController.stream.map((event){
    return event;
  });


  @override
  Stream<List<MatchType>> get outputMatchList => _matchTypeStreamController.stream.map((event){
    return event;
  });

  addToStream(List<Players> players){
    inputPlayerList.add(players);
  }
  addToMatchStream(List<MatchType> matchType){
    inputMatchList.add(matchType);
  }

  @override
  Sink get inputForPlayerOrMatch => _playerOrMatchStreamController.sink;

  @override
  Stream<bool> get outputForPlayerOrMarch => _playerOrMatchStreamController.stream.map((playerOrMatch) {
    print('inside a stream $playerOrMatch');
    return playerOrMatch;
  });


}

abstract class HomePageInput{
  Sink get inputPlayerList;
  Sink get inputMatchList;
  Sink get inputForPlayerOrMatch;

}
abstract class HomePageOutput{
  Stream<List<Players>> get outputPlayerList;
  Stream<List<MatchType>> get outputMatchList;
  Stream<bool> get outputForPlayerOrMarch;
}