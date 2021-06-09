import 'package:flutter/material.dart';
import 'package:my_first_demo_app/utils/routes.dart';
import 'package:my_first_demo_app/widgets/theams.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _fromkey = GlobalKey<FormState>();

  moveHome(BuildContext context) async {
    if (_fromkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _fromkey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login_image.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Welcome $name",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: (const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0)),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter User Name",
                        labelText: "User Name",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "User Name can't be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Enter Password", labelText: "Password"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password can't be empty";
                          } else if (value.length < 6) {
                            return "Password length should be atleast 6";
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 40.0,
                    ),
                    Material(
                      borderRadius:
                          BorderRadius.circular(changeButton ? 40 : 10),
                      color: context.theme.buttonColor,
                      child: InkWell(
                        splashColor: Colors.red,
                        onTap: () => moveHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          height: 40,
                          width: changeButton ? 40 : 150,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
