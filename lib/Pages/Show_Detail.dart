import 'package:MyList/Component/PassingData_form.dart';
import 'package:MyList/Component/Person.dart';
//import 'package:MyList/Pages/Home.dart';
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
    PassingData args = ModalRoute.of(context).settings.arguments;

//--------------------Method Part-----------------
    int findID(String nameVal) {
      for (int d = 0; d < args.allPerson.length; d++) {
        if (args.allPerson[d].name == nameVal) {
          return d + 1;
        }
      }
      return -1;
    }

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

    //-----------------\End of Method Part-------------
    Person nextPerson = findNextPerson();
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Show Detail"),
      // ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () => {
          Navigator.pushNamed(context, '/showEdit_page',
              arguments:
                  PassingData(args.id, args.personWhoClicked, args.allPerson))
        },
        backgroundColor: Colors.black,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: ListView(
        children: [
          Container(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 60, 10, 30),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "${args.id} " + args.personWhoClicked.name,
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
            title: (nextPerson.name != "No Next Person")
                ? Text("${findID(nextPerson.name)} " + nextPerson.name)
                : Text(nextPerson.name),
            trailing: (nextPerson.name != "No Next Person")
                ? Text(
                    "${nextPerson.score}",
                    style: Theme.of(context).textTheme.headline4,
                  )
                : Text(
                    "--:--",
                    style: Theme.of(context).textTheme.headline4,
                  ),
          ),
        ],
      ),
    );
  }
}
