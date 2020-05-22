import 'ListMap.dart';
import 'User.dart';
import 'package:flutter/material.dart';

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