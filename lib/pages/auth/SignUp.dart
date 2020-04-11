import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/models/LoginModel.dart';
import 'package:flutter_template/pages/auth/SignIn.dart';
import 'package:flutter_template/utilities/colors.dart';
import 'package:provider/provider.dart';

import '../../service_locator.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  Contact newContact = new Contact();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return   ChangeNotifierProvider<LoginModel>.value(
        value:  locator<LoginModel>(),
        child: Consumer<LoginModel>(
            builder: (context, model, child) => Scaffold(
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
                                        padding: EdgeInsets.fromLTRB(40.0, 0, 0, 10),
                                        child: const Text(
                                          '|',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 50,
                                              color:Colors.white,
                                              fontFamily: 'Roboto'),
                                        ),
                                      )),
                                  Expanded(
                                    flex: 5,
                                    child: Text(
                                      'Sign Up',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40,
                                        color: Colors.white,
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
                                  padding: EdgeInsets.fromLTRB(35, 45, 0, 0),

                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        new Container(
                                          width: 300.0,
                                          padding: EdgeInsetsDirectional.only(top: 20),
                                          child: Center(
                                            child: new TextFormField(
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                  EdgeInsetsDirectional.only(
                                                      top: 26.0, start: 10.0),
                                                  border: OutlineInputBorder(),
                                                  hintText: "Full Names",
                                                  hintStyle: TextStyle()),
                                              style: new TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black,
                                              ),
                                              validator: (val) => val.isEmpty
                                                  ? 'Name is required'
                                                  : null,
                                              onSaved: (val)=>newContact.name = val.trim(),
                                            ),
                                          ),
                                        ),
                                        new Container(
                                          padding: EdgeInsetsDirectional.only(top: 20),
                                          width: 300.0,
                                          child: Center(
                                            child: new TextFormField(
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                  EdgeInsetsDirectional.only(
                                                      top: 26.0, start: 10.0),
                                                  border: OutlineInputBorder(),
                                                  hintText: "Email Address",
                                                  hintStyle: TextStyle()),
                                              style: new TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black,
                                              ),
                                              validator: (val) => val.contains('@')
                                                  ? null
                                                  : 'Incorrect email',
                                              onSaved: (val){
                                                newContact.username = val.trim();
                                                newContact.email=val.trim();},
                                            ),
                                          ),
                                        ),
                                        new Container(
                                          padding: EdgeInsetsDirectional.only(top: 20),
                                          width: 300.0,
                                          child: Center(
                                            child: new TextFormField(
                                              controller: _pass,
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                  EdgeInsetsDirectional.only(
                                                      top: 26.0, start: 10.0),
                                                  border: OutlineInputBorder(),
                                                  hintText: "Password",
                                                  hintStyle: TextStyle()),
                                              style: new TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black,
                                              ),
                                                validator: (val){
                                                  if(val.isEmpty)
                                                    return 'Empty';
                                                  return null;
                                                }
                                            ),
                                          ),
                                        ),
                                        new Container(
                                          padding: EdgeInsetsDirectional.only(top: 20),
                                          width: 300.0,
                                          child: Center(
                                            child: new TextFormField(
                                              controller: _confirmPass,
                                              validator: (val){
                                                if(val.isEmpty)
                                                  return 'Empty';
                                                if(val != _pass.text)
                                                  return 'Not Match';
                                                return null;
                                              },
                                              onSaved: (val)=>newContact.password=val.trim(),
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                  EdgeInsetsDirectional.only(
                                                      top: 26.0, start: 10.0),
                                                  border: OutlineInputBorder(),
                                                  hintText: "Confirm Password",
                                                  hintStyle: TextStyle()),
                                              style: new TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 16.0,
                                          ),
                                          child: model.state ==
                                              ViewState.Busy
                                              ? CircularProgressIndicator()
                                              : MaterialButton(
                                            color: accentColor,
                                            child: Text(
                                              'Sign Up',
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
                                        new Container(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                30, 0, 30, 0),
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
                                            EdgeInsetsDirectional.only(top: 20),
                                            child: Text(
                                              "Sign Up With",
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
                                    Text("Have an account ?"),
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                                      },
                                      child: Text(
                                        "Sign In",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.redAccent),
                                      ),
                                    )
                                  ],
                                ),
                              ]),
                            )),
                      ],
                    )))
        ));
     
  }
}
