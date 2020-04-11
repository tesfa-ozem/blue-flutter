import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_template/pages/auth/SignIn.dart';
import 'package:http/http.dart' as http;

import '../service_locator.dart';
import 'ResponseModel.dart';

/// Represents the state of the view
enum ViewState { Idle, Busy }

class LoginModel extends ChangeNotifier {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  String get userId => null;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  Future<bool> signUp(Contact contact) async {
    try{
      setState(ViewState.Busy);

      var success =  await _authenticationService.signUpMethod(contact);
      print(success);
      setState(ViewState.Idle);
      return true;
    }catch(e) {
      print(e);
      return e;

    }
  }
}

class AuthenticationService {
  // Inject our Api
  static const _serviceUrl = 'https://home-service-api.herokuapp.com/api/sign_up';
  static final _headers = {'Content-Type': 'application/json'};


  Future<ResponseModel> signUpMethod(Contact contact) async {
    try {


      String json = _toJson(contact);
      final response =
      await http.post(_serviceUrl, headers: _headers, body: json);
      Map userMap = jsonDecode(response.body);
      var responseData = ResponseModel.fromJson(userMap);

      debugPrint(response.body);
      return responseData;
    } catch (e) {
      print('Server Exception!!!');
      print(e);
      return null;
    }
  }

  Future<TokenResponseModel> signInMethod(LoginArgs args) async{
    try{
      String username = args.username;
      String password = args.password;
      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('$username:$password'));
      Map headers = {
        'content-type': 'application/json',
        'accept': 'application/json',
        'authorization': basicAuth
      };
      final response =
      await http.post(_serviceUrl, headers: headers);
      Map token = jsonDecode(response.body);

      var tokenResponse = TokenResponseModel.fromJson(token);
      return tokenResponse;
    }catch (e) {
      print('Server Exception!!!');
      print(e);
      return null;
    }
  }



  String _toJson(Contact contact) {
    var mapData = new Map();
    mapData["fullNames"] = contact.name;

    mapData["email"] = contact.email;
    mapData["password"] = contact.password;
    mapData["username"] = contact.username;

    String json = jsonEncode(mapData);
    return json;
  }
}

class Contact {
  String name;
  String email = '';
  String password = '';
  String username = '';
}

class LoginArgs{
  String username='';
  String password = '';
}
