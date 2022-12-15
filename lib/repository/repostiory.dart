import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:match_ranking/model/players.dart';

import '../model/match_type.dart';

class Repository{

  Future<Map<String,dynamic>> getJson() async{
    final String json=await rootBundle.loadString('assets/ranking_response.json');
    var response=jsonDecode(json);
    if(response['statusCode']==1){
      var responseData=response['responseData'];
      return responseData['result'];
    }else{
      throw Exception('Data Not Found');
    }
  }

    Future<List<MatchType>> getODITeams() async{
    var json=await getJson();
    List odi=json['odiTeams'];
    return odi.map((e){
      return MatchType.toJson(e);
    }).toList();
  }

  Future<List<MatchType>> getTestTeams() async{
    var json=await getJson();
    List odi=json['testTeams'];
    return odi.map((e){
      return MatchType.toJson(e);
    }).toList();

  }

  Future<List<MatchType>> getT20Teams() async{
    var json=await getJson();
    List odi=json['t20Teams'];
    return odi.map((e){
      return MatchType.toJson(e);
    }).toList();

  }

  Future<List<Players>> getOdiBatsman() async{
    var json=await getJson();
    List odiBatsman=json['odiBatsman'];
    return odiBatsman.map((e){
      return Players.toJson(e);
    }).toList();
  }

  Future<List<Players>> getOdiBowler() async{
    var json=await getJson();
    List odiBatsman=json['odiBowler'];
    return odiBatsman.map((e){
      return Players.toJson(e);
    }).toList();
  }

  Future<List<Players>> getAllRounder() async{
    var json=await getJson();
    List odiBatsman=json['odiAllRounder'];
    return odiBatsman.map((e){
      return Players.toJson(e);
    }).toList();
  }

  Future<List<Players>> getTestBatsman() async{
    var json=await getJson();
    List odiBatsman=json['testBatsman'];
    return odiBatsman.map((e){
      return Players.toJson(e);
    }).toList();
  }

  Future<List<Players>> getTestBowler() async{
    var json=await getJson();
    List odiBatsman=json['testBowler'];
    return odiBatsman.map((e){
      return Players.toJson(e);
    }).toList();
  }

  Future<List<Players>> getTestAllRounders() async{
    var json=await getJson();
    List odiBatsman=json['testAllRounder'];
    return odiBatsman.map((e){
      return Players.toJson(e);
    }).toList();
  }


  Future<List<Players>> getT20Batsman() async{
    var json=await getJson();
    List odiBatsman=json['t20Batsman'];
    return odiBatsman.map((e){
      return Players.toJson(e);
    }).toList();
  }

  Future<List<Players>> getT20Bowler() async{
    var json=await getJson();
    List odiBatsman=json['t20Bowler'];
    return odiBatsman.map((e){
      return Players.toJson(e);
    }).toList();
  }


  Future<List<Players>> getT20AllRounder() async{
    var json=await getJson();
    List odiBatsman=json['t20AllRounder'];
    return odiBatsman.map((e){
      return Players.toJson(e);
    }).toList();
  }









}