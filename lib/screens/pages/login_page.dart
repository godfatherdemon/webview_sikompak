import 'package:SIKOMPAK/components/navigation.dart';
import 'package:SIKOMPAK/service/api_service.dart';
import 'package:SIKOMPAK/utils/ProgressHUD.dart';
import 'package:SIKOMPAK/utils/form_helper.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool hidePassword = true;
  bool isApiCallProcess = false;
  String username;
  String password;
  APIService apiService;

  @override
  void initState() {
    apiService = new APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
        // backgroundColor: Theme.of(context).accentColor,
        backgroundColor: Colors.green,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // color: Theme.of(context).primaryColor,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color:
                                  Theme.of(context).hintColor.withOpacity(0.2),
                              offset: Offset(0, 10),
                              blurRadius: 20)
                        ]),
                    child: Form(
                      key: globalKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 25),
                          Text(
                            "Login",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          SizedBox(height: 20),
                          new TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (input) => username = input,
                            validator: (input) => !input.contains('0')
                                ? "Silahkan masukkan email yang sudah terdaftar"
                                : null,
                            decoration: new InputDecoration(
                              hintText: "email",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).accentColor)),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          new TextFormField(
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                            keyboardType: TextInputType.text,
                            onSaved: (input) => password = input,
                            validator: (input) => input.length < 3
                                ? "password lebih dari 3 karakter"
                                : null,
                            obscureText: hidePassword,
                            decoration: new InputDecoration(
                              hintText: "password",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).accentColor)),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Theme.of(context).accentColor,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.4),
                                icon: Icon(hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 80),
                            onPressed: () {
                              if (validateAndSave()) {
                                setState(() {
                                  isApiCallProcess = true;
                                });

                                apiService
                                    .loginCustomer(username, password)
                                    .then((ret) => {
                                          if (ret != null)
                                            {
                                              FormHelper.showMessage(
                                                context,
                                                "SIKOMPAK-LSJ",
                                                "Login Behasil",
                                                "OK",
                                                () {},
                                              )
                                            }
                                          else
                                            {
                                              FormHelper.showMessage(
                                                context,
                                                "SIKOMPAK-LSJ",
                                                "Login Gagal",
                                                "OK",
                                                () {},
                                              )
                                            }
                                        });
                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Theme.of(context).accentColor,
                            shape: StadiumBorder(),
                          ),
                          SizedBox(height: 15),
                          SizedBox(height: 30),
                          FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 80),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Navigation(),
                                ),
                              );
                            },
                            child: Text(
                              "Batal",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.redAccent,
                            shape: StadiumBorder(),
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
