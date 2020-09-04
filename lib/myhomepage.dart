import 'dart:math';
import 'package:fluttertwoday/service/api.dart';
import 'package:flutter/material.dart';
import 'model/team.dart';
import 'package:fluttertwoday/loading.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var teams = List<Team>();
  var isLoading = false;

  void _fetchTeam() async {
    setState(() {
      isLoading = true;
    });

    var tempTeams = await Api().getTeams();
    print(tempTeams);

    setState(() {
      teams = tempTeams;
      isLoading = false;
    });
  }

  Widget _getItem(String image, String title, Color borderColor) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(width: 5, color: _getColor()),
            ),
          ),
          child: Row(
            children: [
              Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 90,
                  child:
                      Image(image: NetworkImage(image), fit: BoxFit.contain)),
              Text(title, style: Theme.of(context).textTheme.headline6,),
            ],
          ),
        ),
      ),
    );
  }

  Color _getColor() {
    var random = Random().nextInt(Colors.primaries.length - 1);
    return Colors.primaries[random];
  }

  List<Widget> _getTeamItem() {
    var items = List<Widget>();
    for (var i = 0; i < teams.length; i++) {
      items.add(_getItem(teams[i].teamBadge, teams[i].teamName, _getColor()));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hallo Dunia")),
      body: isLoading ? LoadingScreen() : ListView(
        children: _getTeamItem(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchTeam,
        tooltip: 'Add Teams',
        child: Icon(Icons.add),
      ),
    );
  }
}
