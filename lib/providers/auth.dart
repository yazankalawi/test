import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  late String _token;
  late DateTime _expireDate;
  late String _userid;
  late Timer _authtimer;

  bool get isAuth {
    // ignore: unnecessary_null_comparison
    return token != null;
  }

  String? get token {
    if (_expireDate != null &&
        _expireDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  String get userId {
    return _userid;
  }

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=[AIzaSyCIyZPBWS5pxa7Wf7FGtYxpx9tfOkZWIiI]';
    try {
      final res = await http.post(url as Uri,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
    } catch (e) {}
  }
}
