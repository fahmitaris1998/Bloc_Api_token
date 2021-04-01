import 'package:flutter/material.dart';

import '../bloc/userbloc.dart';
import '../main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void dispose() {
    // TODO: implement dispose
    bloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              onChanged: bloc.updatedata,
              maxLines: 1,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            TextField(
              onChanged: bloc.updatedatajk,
              maxLines: 1,
              decoration: InputDecoration(hintText: 'Username'),
            ),
            RaisedButton(
              onPressed:(){
                setState(() {
                  bloc.LoginData();
                  print("Login ni");
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>MyApp()));

                });
              },
              child: Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
