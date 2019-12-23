import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(
          primarySwatch: Colors.lightBlue, accentColor: Colors.lightBlueAccent),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController =
        AnimationController(vsync: this, duration: Duration(microseconds: 500));
    _iconAnimation = CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.bounceOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image(
                image: AssetImage("assets/guun.jpeg"),
                fit: BoxFit.cover,
                color: Colors.black87,
                colorBlendMode: BlendMode.darken),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlutterLogo(
                  size: _iconAnimation.value * 100,
                ),
                Form(
                  child: Theme(
                    data: ThemeData(
                        brightness: Brightness.dark,
                        primarySwatch: Colors.teal,
                        inputDecorationTheme: InputDecorationTheme(
                            labelStyle:
                                TextStyle(color: Colors.blue, fontSize: 15.0))),
                    child: Container(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Email Type Koro",
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Password ta dao ebar",
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                          ),
                          MaterialButton(
                            height: 40.0,
                            minWidth: 100.0,
                            color: Colors.blue,
                            textColor: Colors.white,
                            splashColor: Colors.blueAccent,
                            child: Text("Cholo Jai"),
                            onPressed: () => {},
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
