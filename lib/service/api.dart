import 'dart:convert';
import 'dart:async';


import 'package:http/http.dart' as http;
import 'package:fluttertwoday/model/team.dart';

class Api {
  Future<List<Team>> getTeams() async {
     final response =
      await http.get('https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l=English%20Premier%20League');
    // var response = await http.get('https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l=English%20Premier%20League');
    
    Map<String, dynamic> jsonResponse = json.decode(response.body);
    var rawTeam = jsonResponse["teams"];
    var teams = rawTeam.map<Team>(
            (team)=> Team.fromJson(team)
    ).toList();
    return teams;
  }
}