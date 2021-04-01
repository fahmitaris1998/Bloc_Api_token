
import 'package:flutter/foundation.dart';
import 'package:flutter_api_bloc/models/user.dart';
import 'package:flutter_api_bloc/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
class UserBloc{
  final _repository = Repository();
  final _userfetcher = PublishSubject<List<User>>();
  final _title = BehaviorSubject<String>();
  final _jeniskelamin = BehaviorSubject<String>();
  final _idparent = BehaviorSubject<String>();
  final _iduser = BehaviorSubject<String>();

  Stream<List<User>> get allUser => _userfetcher.stream;
  Function(String) get updatedata => _title.sink.add;
  Function(String) get updatedatajk => _jeniskelamin.sink.add;
  Function(String) get updatedataidparent => _idparent.sink.add;
  Function(String) get iduser => _iduser.sink.add;

  fecthalluser() async{
    List<User> user = await _repository.fetchalluser();
    _userfetcher.sink.add(user);
  }
  addsavedata(){
    print(_title.value);
    print(_jeniskelamin.value);
    print(_idparent.value);
    _repository.addSaveData(_title.value,_jeniskelamin.value,_idparent.value);
  }
  LoginData(){
    _repository.loginData(_title.value,_jeniskelamin.value);
  }

  AddChecklist(){
    _repository.addchekclistrepo(_title.value);
  }


  DeleteData(String iduser){
    _repository.deleteData(iduser);
  }

  dispose(){
    _userfetcher.close();
    _title.close();
    _jeniskelamin.close();
    _idparent.close();
    _iduser.close();
  }
}

final bloc = UserBloc();
