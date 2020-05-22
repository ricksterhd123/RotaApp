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

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add house tenants'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                UserForm(onValidated: this.addUser)
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Save'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Main menu'),
        ),
        body: Center(child: Flex(direction: Axis.vertical, mainAxisSize: MainAxisSize.min, children: [UsersColumnWidget(users: this.users)])),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // Add your onPressed code here!
            var result = await this._showMyDialog();

          },
          child: Icon(Icons.navigation),
          backgroundColor: Colors.green,
        ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}