import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:math';

// import 'package:cpfcnpj/cpfcnpj.dart';
// import 'package:mobx/mobx.dart';
// import 'package:http/http.dart' as http;
import 'package:confly_web_adm/src/utils/helper.dart' as GLOBAL;
import 'package:mobx/mobx.dart';

part 'base_store.g.dart';

class BaseStore = _BaseStore with _$BaseStore;

abstract class _BaseStore with Store {



  @observable
  int page = 0;

  @action
  void setPage(int value) => page = value;

}