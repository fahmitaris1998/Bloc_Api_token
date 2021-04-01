import 'package:flutter_api_bloc/resources/userApiProvider.dart';
import 'package:flutter_api_bloc/models/user.dart';
import 'dart:async';

class Repository{
  final userapiprovider = UserApiProvider();

  Future<List<User>> fetchalluser() => userapiprovider.fetchuserlist();
  Future addSaveData(String title,String jk,String idparent) => userapiprovider.addData(title,jk,idparent);

  Future loginData(String title,String jk) => userapiprovider.Login(title, jk);

  Future deleteData(String iduser)=>userapiprovider.deletedata(iduser);
  Future addchekclistrepo(String iduser)=>userapiprovider.addcheckklist(iduser);
}