import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;
import 'package:flutter_api_bloc/models/user.dart';
import 'dart:async';

import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UserApiProvider{
  Client client = Client();

  Future<List<User>> fetchuserlist() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final _url= 'http://18.139.50.74:8080/checklist';
    print("masuk");
    final response = await client.get(_url,
        headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer '+ prefs.getString('token'),
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
    var response = await client.post('http://18.139.50.74:8080/register',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body:jsonEncode({
      "email": title,
      "password": jk,
      "username":idparent
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

  Future Login(title,jk) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('klik api login');
    var response = await client.post('http://18.139.50.74:8080/login',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body:jsonEncode({
          "password": title,
          "username": jk
        })
    );
    print(jsonDecode(response.body)['data']['token']);
    if(response.statusCode == 200){
      print("berhasil");
      await prefs.setString('token', jsonDecode(response.body)['data']['token']);
      return response;
    }else{
      throw Exception('failed Add data');
    }

  }

  Future addcheckklist(title) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('klik api create');
    var response = await client.post('http://18.139.50.74:8080/checklist',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer '+ prefs.getString('token'),
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("klik API delete");
    var url= 'http://18.139.50.74:8080/checklist/'+id;
    print(url);
    var response = await client.delete(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer '+prefs.getString('token'),
        }
    );
    print(response.body);
    print(response.statusCode);

  }

}