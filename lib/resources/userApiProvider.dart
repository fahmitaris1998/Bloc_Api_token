import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;
import 'package:flutter_api_bloc/models/user.dart';
import 'dart:async';

import 'package:http/io_client.dart';
class UserApiProvider{
  Client client = Client();
  var token = 'eyJhbGciOiJIUzUxMiJ9.eyJyb2xlcyI6W119.i2OVQdxr08dmIqwP7cWOJk5Ye4fySFUqofl-w6FKbm4EwXTStfm0u-sGhDvDVUqNG8Cc7STtUJlawVAP057Jlg';

  Future<List<User>> fetchuserlist() async{
    final _url= 'http://18.139.50.74:8080/checklist';
    print("masuk");
    final response = await client.get(_url,
        headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJyb2xlcyI6W119.i2OVQdxr08dmIqwP7cWOJk5Ye4fySFUqofl-w6FKbm4EwXTStfm0u-sGhDvDVUqNG8Cc7STtUJlawVAP057Jlg',
    }
    );
    if(response.statusCode==200){
      print(response.body);
      return compute(userFromJson, response.body);
    }else{
      throw Exception('failed load data');
    }
  }
  
  Future addData(title,jk,idparent) async{
    print('klik api create');
    var response = await client.post('http://192.168.13.107/create.php',body:{
      "email": title,
      "password": jk,
      "username":idparent
    });

    if(response.statusCode == 200){
      print("berhasil");
      return response;
    }else{
      throw Exception('failed Add data');
    }


  }

  Future Login(title,jk) async{

    try{
      final ioc = new HttpClient();
      ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);
      print('klik api Login');
      var response = await http.post('https://18.139.50.74:8080/login',
          body:{
            "password": title,
            "username":jk
          });

      print(response.body);

      if(response.statusCode == 200){
        print("berhasil");
        return response;
      }else{
        throw Exception('failed Add data');
      }

    }catch(e){
      print(e.toString());
    }

  }

  Future addcheckklist(title) async{

    print('klik api create');
    var response = await client.post('https://18.139.50.74:8080/checklist',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJyb2xlcyI6W119.i2OVQdxr08dmIqwP7cWOJk5Ye4fySFUqofl-w6FKbm4EwXTStfm0u-sGhDvDVUqNG8Cc7STtUJlawVAP057Jlg',
        },
        body:jsonEncode({
          "name": title,
        })
    );
    print(response.body);
    if(response.statusCode == 200){
      print("berhasil");
      return response;
    }else{
      throw Exception('failed Add data');
    }
  }


  Future deletedata(id) async{
    print("klik API delete");
    var url= 'https://18.139.50.74:8080/checklist/'+id;
    var response = await client.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJyb2xlcyI6W119.i2OVQdxr08dmIqwP7cWOJk5Ye4fySFUqofl-w6FKbm4EwXTStfm0u-sGhDvDVUqNG8Cc7STtUJlawVAP057Jlg',
        }
    );

    if(response.statusCode == 200){
      return response;
    }else{
      throw Exception('failed update data');
    }

  }

}