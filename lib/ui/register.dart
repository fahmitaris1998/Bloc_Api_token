import 'package:flutter/material.dart';
import 'package:flutter_api_bloc/bloc/userbloc.dart';
import 'package:flutter_api_bloc/resources/userApiProvider.dart';

import '../bloc/userbloc.dart';
import '../main.dart';
import 'home.dart';

class Register extends StatefulWidget {
  final String id_user;
  final String nama2;
  final String jenis_kelamin;
  final String id_parent;

  const Register({Key key, this.id_user, this.nama2, this.jenis_kelamin, this.id_parent}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {


  @override
  void dispose() {
    // TODO: implement dispose
    bloc.dispose();
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              onChanged: bloc.updatedata,
              maxLines: 1,
              decoration: InputDecoration(hintText: 'email'),
            ),
            TextField(
              onChanged: bloc.updatedatajk,
              maxLines: 1,
              decoration: InputDecoration(hintText: 'password'),
            ),
            TextField(
              onChanged: bloc.updatedataidparent,
              maxLines: 1,
              decoration: InputDecoration(hintText: 'username'),
            ),
            RaisedButton(
                onPressed:(){
                  setState(() {
                      bloc.addsavedata();
                      print("Register ni");
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
