import 'utils.dart';
import 'package:flutter/material.dart';

/**
 * House tenant
 */
class User {
  String firstname;
  String surname;
  User(firstname, surname) {
    this.firstname = firstname;
    this.surname = surname;
  }
}

User a = new User("Hello", "World");
User b = new User("Test", "Testing");
User c = new User("wew", "wew");
List<User> testUsers = [a, b, c];


///**
// * Two columns, one for firstname and other for surname - simple.
// */
//class UserRowWidget extends StatelessWidget {
//  UserRowWidget({Key key, @required this.user}) : super(key: key);
//
//  final User user;
//  @override
//  Widget build(BuildContext context) {
//    return DataRow(cells: [DataCell(Text(user.firstname)), DataCell(Text(user.surname))]);
//  }
//}
/*
return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Name',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Age',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Role',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Sarah')),
            DataCell(Text('19')),
            DataCell(Text('Student')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Janine')),
            DataCell(Text('43')),
            DataCell(Text('Professor')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('William')),
            DataCell(Text('27')),
            DataCell(Text('Associate Professor')),
          ],
        ),
      ],
    );
  }
 */
class UsersColumnWidget extends StatelessWidget {
  UsersColumnWidget({Key key, @required this.users}) : super(key: key);

  final List<User> users;
  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
          children: map<Widget, User>(this.users, (key, value) {
            return Container(height: 50, color: Colors.amber[600], child: Center(child: Text(value.firstname + value.surname)));
          })
        );
  }
}

void main() => runApp(RotaApp());

class RotaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RotaApp',
      home: MainScreen(),
    );
  }
}

/**
 * Store users here - trying to figure out flutter and dart ... frustrating
 */
class _MainScreenState extends State<MainScreen> {
  List<User> users = [];

  void addUser(String fullName) {
    var nameParts = fullName.split(" ");
    var firstName = nameParts[0];
    var surname = nameParts[1];

    print(firstName);
    print(surname);

    this.setState(() {
      this.users.add(new User(firstName, surname));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main menu'),
      ),
      body: Center(child: Flex(direction: Axis.vertical, mainAxisSize: MainAxisSize.min, children: [UsersColumnWidget(users: users), UserForm(onValidated: addUser)]))
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class UserForm extends StatefulWidget {
  UserForm({@required this.onValidated}):super();
  final Function onValidated;
  @override
  _FormState createState() => _FormState(onValidated: onValidated);
}

class _FormState extends State<UserForm> {
  _FormState({@required this.onValidated}):super();
  final _formKey = GlobalKey<FormState>();
  final Function onValidated; // Callback: (firstname, surname, err){ ... }
  String fullName;

  String _fullName;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter their full name',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onChanged: (value) {
              this.fullName = value;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // Process data.
                  this.onValidated.call(this.fullName);
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}