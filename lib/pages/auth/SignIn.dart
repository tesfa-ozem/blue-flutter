import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/models/LoginModel.dart';
import 'package:flutter_template/pages/auth/SignUp.dart';
import 'package:flutter_template/utilities/colors.dart';
import 'package:provider/provider.dart';

import '../../service_locator.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  Contact newContact = new Contact();
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>.value(
        value:  locator<LoginModel>(),
        child: Consumer<LoginModel>(
          builder: (context, model, child) => Material(
              child: Scaffold(
                  resizeToAvoidBottomPadding: false,
                  body: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/login_back_ground.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(40.0, 0, 0, 10),
                                      child: const Text(
                                        '|',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 50,
                                            color: Colors.white,
                                            fontFamily: 'Roboto'),
                                      ),
                                    )),
                                    Expanded(
                                      flex: 5,
                                      child: Text(
                                        'Sign In',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 4,
                              child: Center(
                                child: ListView(children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(35, 35, 0, 0),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                                    child: Form(
                                      key: _formKey,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          new Container(
                                            width: 300.0,
                                            padding: EdgeInsetsDirectional.only(
                                                top: 20),
                                            child: Center(
                                              child: new TextFormField(
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .only(
                                                                top: 26.0,
                                                                start: 10.0),
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText: "User Name",
                                                    hintStyle: TextStyle()),
                                                style: new TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.black,
                                                ),
                                                validator: (val) => val.isEmpty
                                                    ? 'Name is required'
                                                    : null,
                                                onSaved: (val) =>
                                                    newContact.name = val,
                                              ),
                                            ),
                                          ),
                                          new Container(
                                            padding: EdgeInsetsDirectional.only(
                                                top: 20),
                                            width: 300.0,
                                            child: Center(
                                              child: new TextField(
                                                obscureText: true,
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .only(
                                                                top: 26.0,
                                                                start: 10.0),
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText: "Password",
                                                    hintStyle: TextStyle()),
                                                style: new TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                          FlatButton(
                                            onPressed: () {},
                                            child: Text(
                                              "Forgot password ?",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black38),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 16.0,
                                            ),
                                            child: new ConstrainedBox(
                                              constraints: const BoxConstraints(
                                                  minWidth: 300.0,
                                                  minHeight: 40.0),
                                              child: model.state ==
                                                      ViewState.Busy
                                                  ? CircularProgressIndicator()
                                                  : MaterialButton(
                                                      color: accentColor,
                                                      child: Text(
                                                        'Sign In',
                                                      ),
                                                      textColor: Colors.white,
                                                      onPressed: () async {
                                                        final FormState form =
                                                            _formKey
                                                                .currentState;
                                                        if (!form.validate()) {
                                                          print(
                                                              'Form is not valid!  Please review and correct.');
                                                        } else {
                                                          form.save();
                                                          var loginSuccess =
                                                              await model.signUp(
                                                                  newContact);
                                                          if (loginSuccess) {
                                                            // Navigate to the home view
                                                          }
                                                        }
                                                      },
                                                      height: 40,
                                                      minWidth: 140,
                                                      elevation: 2,
                                                    ),
                                            ),
                                          ),
                                          new Container(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(30, 0, 30, 0),
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                      child: Text(
                                                    "OR",
                                                    textAlign: TextAlign.center,
                                                  )),
                                                ],
                                              )),
                                          new Container(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      top: 20),
                                              child: Text(
                                                "Sign In With",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 16),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  ButtonBar(
                                    alignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      MaterialButton(
                                        color: Colors.indigo,
                                        child: Text(
                                          'Facebook',
                                        ),
                                        textColor: Colors.white,
                                        onPressed: () {},
                                        height: 40,
                                        minWidth: 140,
                                        elevation: 2,
                                      ),
                                      MaterialButton(
                                        color: Colors.redAccent,
                                        child: Text('Gmail'),
                                        textColor: Colors.white,
                                        onPressed: () {},
                                        height: 40,
                                        minWidth: 140,
                                        elevation: 2,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Dont have an account ?"),
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignUp()));
                                        },
                                        child: Text(
                                          "Sign Up",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.redAccent),
                                        ),
                                      )
                                    ],
                                  ),
                                ]),
                              )),
                        ],
                      )))),
        ));
  }
}


