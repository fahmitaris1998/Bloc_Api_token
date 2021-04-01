import 'package:flutter/material.dart';
import 'package:flutter_api_bloc/bloc/userbloc.dart';
import 'package:flutter_api_bloc/resources/userApiProvider.dart';

import '../bloc/userbloc.dart';
import '../main.dart';
import 'home.dart';

class Create extends StatefulWidget {
  final String id_user;
  final String nama2;
  final String jenis_kelamin;
  final String id_parent;

  const Create({Key key, this.id_user, this.nama2, this.jenis_kelamin, this.id_parent}) : super(key: key);
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {


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
        title: Text('Create'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              onChanged: bloc.updatedata,
              maxLines: 1,
              decoration: InputDecoration(hintText: 'Name'),
            ),
            RaisedButton(
              onPressed:(){
                setState(() {
                  bloc.AddChecklist();
                  print("create ni");
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
