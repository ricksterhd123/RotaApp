import 'User.dart';
import 'UserColumnWidget.dart';
import 'UserForm.dart';
import 'package:flutter/material.dart';

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