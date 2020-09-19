import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Person {
  String name;
  int score;
  Person(this.name, this.score);
}

class PassingData {
  Person personWhoClicked;
  List<Person> allPerson = [];

  PassingData(this.personWhoClicked, this.allPerson);
}

List<Person> personList = [
  Person("Tinky Winky", 80),
  Person("Dipsy", 77),
  Person("Lala", 85),
  Person("Po", 60),
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var newPerson = Person("", 0);
    //PassingData passedData1 = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("My List"),
        // ),
        body: ListView(
          children: [
            Text(
              "My List",
              style: Theme.of(context).textTheme.headline2,
            ),
            for (int i = 0; i < personList.length; i++)
              Card(
                child: ListTile(
                  title: Text("${i + 1}" + personList[i].name),
                  trailing: Text(
                    "${personList[i].score}",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/showDtail_page",
                        arguments: PassingData(personList[i], personList));
                  },
                ),
              ),
            // ListTile(
            //   title: Text("2 " + personList[1].name),
            //   trailing: Text(
            //     "${personList[1].score}",
            //     style: Theme.of(context).textTheme.headline3,
            //   ),
            //   onTap: () {
            //     Navigator.pushNamed(context, "/showDtail_page",
            //         arguments: PassingData(personList[1], personList));
            //   },
            // ),
            // ListTile(
            //   title: Text("3 " + personList[2].name),
            //   trailing: Text(
            //     "${personList[2].score}",
            //     style: Theme.of(context).textTheme.headline3,
            //   ),
            //   onTap: () {
            //     Navigator.pushNamed(context, "/showDtail_page",
            //         arguments: PassingData(personList[2], personList));
            //   },
            // ),
            // ListTile(
            //   title: Text("4 " + personList[3].name + "${personList.length}"),
            //   trailing: Text(
            //     "${personList[3].score}",
            //     style: Theme.of(context).textTheme.headline3,
            //   ),
            //   onTap: () {
            //     Navigator.pushNamed(context, "/showDtail_page",
            //         arguments: PassingData(personList[3], personList));
            //   },
            // ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            personList.add(newPerson),
            Navigator.pushNamed(context, '/showEdit_page',
                arguments: PassingData(newPerson, personList))
          },
          backgroundColor: Colors.black,
          child: Icon(
            Icons.add,
          ),
        ));
  }
}
