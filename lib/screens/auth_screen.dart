import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(215, 117, 255, 1).withOpacity(0.5),
                      Color.fromARGB(255, 188, 117, 1).withOpacity(0.9)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0, 1])),
          ),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                        child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.deepOrange.shade900,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 8,
                                color: Colors.black,
                                offset: Offset(0, 8))
                          ]),
                      transform: Matrix4.rotationZ(-8 * pi / 180)
                        ..translate(-10.0),
                      margin: EdgeInsets.only(bottom: 20),
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 94),
                      child: const Text(
                        "myshop",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontFamily: 'Anton'),
                      ),
                    )),
                    Flexible(
                      flex: deviceSize.width > 600 ? 2 : 1,
                      child: authCard(),
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class authCard extends StatefulWidget {
  const authCard({super.key});

  @override
  State<authCard> createState() => _authCardState();
}

enum AuthMode { Login, SignUp }

class _authCardState extends State<authCard>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formkey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;

  Map<String, String> _authData = {'email': '', 'passord': ''};

  var _isloading = false;

  final _passwordController = TextEditingController();
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _slideAnimation = Tween<Offset>(begin: Offset(0, -0.15), end: Offset(0, 0))
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));

    _opacityAnimation = Tween<double>(begin: 0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Future<void> submit() async {
    if (!_formkey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isloading = true;
    });

    try {} catch (error) {}
    setState(() {
      _isloading = false;
    });
  }

  void _switchAuthMide() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode == AuthMode.SignUp;
      });
      _controller.forward();
    } else {
      setState(() {
        _authMode == AuthMode.Login;
      });
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 20,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
        height: 360,
        width: deviceSize.width * 0.75,
        padding: EdgeInsets.all(16),
        constraints: BoxConstraints(
          minHeight: _authMode == AuthMode.SignUp ? 500 : 260,
        ),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    if (val!.isEmpty || !val.contains('@')) {
                      return 'invalid email';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _authData['email'] = val!;
                  },
                  decoration: InputDecoration(
                    label: Text("email"),
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (val) {
                    if (val!.isEmpty || val.length < 5) {
                      return 'Password is too short';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _authData['password'] = val!;
                  },
                  decoration: InputDecoration(
                    label: Text("password"),
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (val) {
                    if (val != _passwordController.text) {
                      return 'Password dose not match';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _authData['password'] = val!;
                  },
                  decoration: InputDecoration(
                    label: Text("confirm password"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                if (_isloading) CircularProgressIndicator(),
                ElevatedButton(
                  onPressed: submit,
                  child: Text("Login"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrange.shade900,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      textStyle: TextStyle(color: Colors.white),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 8)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("Auth2Screen");
                  },
                  child: Text("if you already have an account..."),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      splashColor: Colors.transparent,
                      onPressed: () {},
                      icon: Icon(FontAwesomeIcons.whatsapp),
                    ),
                    IconButton(
                      splashColor: Colors.transparent,
                      onPressed: () {},
                      icon: Icon(FontAwesomeIcons.instagram),
                    ),
                    IconButton(
                      splashColor: Colors.transparent,
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.facebookF,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
