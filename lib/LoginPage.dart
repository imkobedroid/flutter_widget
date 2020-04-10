import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      title: '我的应用',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool _isObscure = true;
  Color _eyeColor;
  List _loginMethod = [
    {"title": "facebook", "icon": Icons.local_gas_station},
    {"title": "google", "icon": Icons.local_gas_station},
    {"title": "twitter", "icon": Icons.local_gas_station}
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 22.0),
        children: <Widget>[
          SizedBox(
            height: kToolbarHeight,
          ),
          buildTitle(),
          buildTitleLine(),
          SizedBox(height: 70.0),
          buildEmailTextField(),
          SizedBox(height: 30.0),
          buildPasswordTextField(context),
        ],
      ),
    );
  }

  Padding buildTitle() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Login',
        style: TextStyle(fontSize: 42.0),
      ),
    );
  }

  // ignore: missing_return
  Padding buildTitleLine() {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, top: 4.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          color: Colors.black,
          width: 40.0,
          height: 2.0,
        ),
      ),
    );
  }

  // ignore: missing_return
  TextFormField buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Emall Address',
      ),
      validator: (String email) {
        var emailReg = RegExp(
            r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
        if (!emailReg.hasMatch(email)) {
          return '请输入正确的邮箱地址';
        }
        return "";
      },
      onSaved: (String value) => _email = value,
    );
  }

  // ignore: missing_return
  TextFormField buildPasswordTextField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password',
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                  _eyeColor = _isObscure
                      ? Colors.grey
                      : Theme.of(context).iconTheme.color;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: _eyeColor,
              ))),
      validator: (String value) {
        if (value.isEmpty) {
          return '请输入密码';
        }
        return "";
      },
      onSaved: (String value) => _password = value,
    );
  }
}
