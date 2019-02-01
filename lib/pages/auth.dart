import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _emailValue;
  String _passwordValue;
  bool _acceptTerms = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.7), BlendMode.dstATop),
                image: AssetImage('assets/login_background.jpg'))),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Email',filled: true, fillColor: Colors.white),
                keyboardType: TextInputType.emailAddress,
                onChanged: (String value) {
                  setState(() {
                    _emailValue = value;
                  });
                },
              ),
              SizedBox(height: 10.0,),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  fillColor: Colors.white,
                  filled: true
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    _passwordValue = value;
                  });
                },
              ),
              SwitchListTile(
                  value: _acceptTerms,
                  onChanged: (bool value) {
                    setState(() {
                      _acceptTerms = value;
                    });
                  },
                  title: Text('Accept terms')),
              SizedBox(height: 20.0),
              RaisedButton(
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                child: Text('Login'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/products');
                },
              )
            ],
            ),
          ),
        ),
      ),
    );
  }
}
