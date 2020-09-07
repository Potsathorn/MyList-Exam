import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Person {
  String name;
  int score;
  Person(this.name, this.score);
}

class HomePage extends StatelessWidget {
  List<Person> personList = [
    Person("Tinky Winky", 80),
    Person("Dipsy", 77),
    Person("Lala", 85),
    Person("Po", 60),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My List"),
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text("1 " + personList[0].name),
              trailing: Text(
                "${personList[0].score}",
                style: Theme.of(context).textTheme.headline3,
              ),
              onTap: (){
                Navigator.pushNamed(context, "/showDtail_page",arguments: personList[0]);
              },
            ),
            ListTile(
              title: Text("2 " + personList[1].name),
              trailing: Text(
                "${personList[1].score}",
                style: Theme.of(context).textTheme.headline3,
              ),
              onTap: () {
                Navigator.pushNamed(context, "/showDtail_page",arguments: personList[1]);
              },
            ),
            ListTile(
              title: Text("3 " + personList[2].name),
              trailing: Text(
                "${personList[2].score}",
                style: Theme.of(context).textTheme.headline3,
              ),
              onTap: () {
                Navigator.pushNamed(context, "/showDtail_page",arguments: personList[2]);
              },
            ),
            ListTile(
              title: Text("4 " + personList[3].name),
              trailing: Text(
                "${personList[3].score}",
                style: Theme.of(context).textTheme.headline3,
              ),
              onTap: () {
                Navigator.pushNamed(context, "/showDtail_page",arguments: personList[3]);
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          backgroundColor: Colors.black,
          child: Icon(
            Icons.add,
          ),
        ));
  }
}
