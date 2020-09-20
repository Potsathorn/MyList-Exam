import 'package:MyList/Component/Person.dart';

class PassingData {
  int id;
  Person personWhoClicked;
  List<Person> allPerson = [];

  PassingData(this.id, this.personWhoClicked, this.allPerson);
}