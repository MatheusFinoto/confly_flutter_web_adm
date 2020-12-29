import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
//import 'package:http/http.dart' as http;
///import 'package:logi_defense/src/utils/helper.dart' as GLOBAL;

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store{

  @observable
  bool loading = false;

  @observable
  int loginStatus = 0;

  /// 0 - NADA
  /// 1 - CARREGANDO
  /// 2 - SUCESSO - COM TODOS OS DADOS
  /// 3 - SUCESSO - SEM TODOS OS DADOS
  /// 4 - ERRO NO POST
  /// 5 - TIMEOUT


  @action
  Future<void> login()async{
    loading = true;
    try{
      await Future.delayed(Duration(seconds: 3));
      loginStatus = 2;



    }on TimeoutException catch(e){
      print(e);
      loginStatus = 5;
    }catch(e){
      loginStatus = 4;
      print(e);
    }
    loading = false;
  }

  @computed
  Function get validToLogin=> (!loading) ? login : null;







}