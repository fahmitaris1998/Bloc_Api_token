import 'package:flutter/material.dart';
import 'package:flutter_api_bloc/bloc/userbloc.dart';
import 'package:flutter_api_bloc/main.dart';
import 'package:flutter_api_bloc/models/user.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'carduser.dart';
import 'create.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    bloc.fecthalluser();
    super.initState();
  }
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
        title: Text("List"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>Create()));
        },
        child: Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: bloc.allUser,
        builder: (context, AsyncSnapshot<List<User>> snapshot){
          if(snapshot.data != null){
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,index){
                  return Slidable(
                      key: ValueKey(index),
                      actionPane: SlidableDrawerActionPane(),
                      secondaryActions: [

                        Container(
                          padding:EdgeInsets.symmetric(vertical: 25.0,horizontal: 25.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: Color.fromRGBO(223, 44, 44, 1)
                            ),
                            child: IconSlideAction(
                              color: Colors.transparent,
                              icon: Icons.delete_outline,
                              closeOnTap: true,
                              onTap: () {
                                bloc.DeleteData(snapshot.data[index].id.toString());
                                print("Delete");
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>MyApp()));
                              },
                            ),
                          ),
                        )
                      ],
                      //dismissal: SlidableDismissal(child: SlidableDrawerDismissal()),
                      child: CardProfile(user: snapshot.data[index],)
                  );

                }
            );
          }else{
            return Text("wait....");
          }
        },
      ),
    );
  }
}
