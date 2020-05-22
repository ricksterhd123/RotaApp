import 'package:flutter/material.dart';

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
              child: Text('Add user'),
            ),
          ),
        ],
      ),
    );
  }
}