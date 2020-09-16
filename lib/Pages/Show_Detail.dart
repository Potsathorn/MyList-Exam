import 'package:MyList/Pages/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShowDetailState();
  }
}

class _ShowDetailState extends State<ShowDetail> {
  @override
  Widget build(BuildContext context) {
    //var person = Person(null, null);
    PassingData args = ModalRoute.of(context).settings.arguments;

    Person findNextPerson() {
      List<Person> higherScore = [];
      int maxScore = args.allPerson[0].score;
      for (var k in args.allPerson) {
        if (k.score >= maxScore) {
          maxScore = k.score;
        }
      }

      while (args.personWhoClicked.score != maxScore) {
        for (var i in args.allPerson) {
          if (i.score > args.personWhoClicked.score) {
            higherScore.add(i);
          }
        }

        int minScore = higherScore[0].score;
        Person personNext;

        for (var j in higherScore) {
          if (j.score <= minScore) {
            minScore = j.score;
            personNext = j;
          }
        }

        return personNext;
      }

      return Person("No Next Person", args.personWhoClicked.score);
    }

    //  List<Person> allPerson = [];
    Person nextPerson = findNextPerson();

    //person = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Show Detail"),
      // ),
      body: ListView(
        children: [
          Container(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/showEdit_page',
                              arguments: PassingData(
                                  args.personWhoClicked, args.allPerson));
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  ListTile(
                    title: Text(
                      args.personWhoClicked.name,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    trailing: Text(
                      "${args.personWhoClicked.score}",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 400, 10, 30),
            child: Center(
                child: Text(
              "Next Person >>",
              style: Theme.of(context).textTheme.headline4,
            )),
          ),
          ListTile(
            title: Text(nextPerson.name),
            trailing: Text(
              "${nextPerson.score}",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ],
      ),
      // appBar: AppBar(
      //   title: Text("1 "+person1.name),
      // ),
    );
  }
}
