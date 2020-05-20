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

/**
 * Two columns, one for firstname and other for surname - simple.
 */
class UserRowWidget extends StatelessWidget {
  UserRowWidget({Key key, @required this.user}) : super(key: key);

  final User user;
  @override
  Widget build(BuildContext context) {
    return Column(children: [Row(children: [Text("Firstname"), Text("Surname")]), Row(children: [Text(user.firstname), Text(user.surname)])]);
  }
}

class UsersColumnWidget extends StatelessWidget {
  UsersColumnWidget({Key key, @required this.users}) : super(key: key);

  final List<User> users;
  @override
  Widget build(BuildContext context) {
    Map<int, UserRowWidget> mRowWidgets;
    List<UserRowWidget> rowWidgets = new List<UserRowWidget>();
    // List<User> -> Map<int, User> -> List<UserRowWidget>
    this.users.asMap().forEach((key, value){ rowWidgets.add(UserRowWidget(user: value)); });
    return Column(children: rowWidgets);
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main menu'),
      ),
      body: Column(children: [UsersColumnWidget(users: testUsers,),
            RaisedButton(child: Text("Add users"), onPressed: () {})
          ])
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

