import 'package:doctorx/Screens/HomeScreen.dart';
import 'package:doctorx/firebases/Auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _email = TextEditingController();
  TextEditingController _userName = TextEditingController();
  TextEditingController _password = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();
  bool _validateForm() {
    final formState = _key.currentState;
    return formState!.validate() ? true : false;
  }

  bool _vis = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _key,
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_outlined)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/logo.png'),
                      backgroundColor: Colors.grey.shade200,
                    ),
                    Center(
                        child: Container(
                            width: 300,
                            height: 500,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextFormField(
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    controller: _userName,
                                    textInputAction: TextInputAction.next,
                                    validator: (firstname) => firstname!.isEmpty
                                        ? 'UserName be Can\‘t embty'
                                        : null,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(29)),
                                      hintText: 'User Name',
                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade400),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    controller: _email,
                                    validator: (email) => email!.isEmpty
                                        ? 'Email Can\‘t be Empty'
                                        : null,
                                    decoration: InputDecoration(
                                        hintText: 'Email',
                                        hintStyle: TextStyle(
                                            color: Colors.grey.shade400),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(29))),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: _password,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    textInputAction: TextInputAction.done,
                                    validator: (password) {
                                      if(password!.isEmpty){
                                        return 'Password Can\‘t be Empty';
                                      }if(password.length>6){
                                        return "'Password Can\‘t be less Than 6";
                                      }
                                            return null;
                                    },
                                    obscureText: _vis ? false : true,
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _vis = !_vis;
                                              });
                                            },
                                            icon: _vis
                                                ? Icon(
                                                    Icons.visibility,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  )
                                                : Icon(
                                                    Icons.visibility_off,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  )),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(29)),
                                        hintText: "Password",
                                        hintStyle: TextStyle(
                                            color: Colors.grey.shade400)),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Theme.of(context).primaryColor),
                                    child: TextButton(
                                      onPressed: () {
                                        if (_validateForm()) {
                                          final email = _email.text;
                                          final password = _password.text;
                                          final name = _userName.text;
                                          AuthServices().registerWithEmail(
                                              email, password, name);
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                    builder: (_) => HomeScreen(
                                                      userName: _userName.text,
                                                    ),
                                                  ),
                                                  (route) => false);
                                        } else {}
                                      },
                                      child: const Text(
                                        'SIGN UP',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  )
                                ]))),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/3d-fluency-google.png'),
                        radius: 30,
                        backgroundColor: Colors.white,
                      ),
                      onTap: () {},
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
