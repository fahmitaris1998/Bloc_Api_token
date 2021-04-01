import 'package:flutter/material.dart';
import 'package:flutter_api_bloc/models/user.dart';

class CardProfile extends StatelessWidget {
  final User user;

  const CardProfile({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container()
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ID : "+ user.id.toString(),style: TextStyle(color: Colors.white),),
              Text("Nama : "+ user.name,style: TextStyle(color: Colors.white)),
              user.itemCompletionStatus == false?
              Text("ItemCompletionStatus : True",style: TextStyle(color: Colors.white))
                  : Text("ItemCompletionStatus : False",style: TextStyle(color: Colors.white))

            ],
          )
        ],
      ),
    );
  }
}
