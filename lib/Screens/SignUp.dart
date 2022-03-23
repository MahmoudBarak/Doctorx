import 'package:doctorx/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _email = TextEditingController();
  TextEditingController _userName = TextEditingController();
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
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back_outlined)),
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
                                    controller:_userName ,
                                     textInputAction: TextInputAction.next,
                                    validator: (firstname) => firstname!.isEmpty
                                        ? 'UserName be Can\‘t embty'
                                        : null,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(29)),
                                      hintText: 'User Name',
                                      hintStyle: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    controller: _email,
                                    validator: (email) => email!.isEmpty
                                        ? 'Email Can\‘t be Empty'
                                        : null,
                                    decoration: InputDecoration(
                                        hintText: 'Email',
                                        hintStyle: TextStyle(color: Colors.black),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(29))),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    textInputAction: TextInputAction.done,
                                    validator: (password) => password!.isEmpty
                                        ? 'Password Can\‘t be Empty '
                                        : null,
                                    obscureText: _vis ? false : true,
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _vis = !_vis;
                                              });
                                            },
                                            icon: _vis
                                                ? const Icon(
                                                    Icons.visibility,
                                                    color: Colors.deepPurpleAccent,
                                                  )
                                                : const Icon(
                                                    Icons.visibility_off,
                                                    color: Colors.deepPurpleAccent,
                                                  )),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(29)),
                                        hintText: "Password",
                                        hintStyle: TextStyle(color: Colors.black)),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.deepPurpleAccent),
                                    child: TextButton(
                                      onPressed: () {
                                        if (_validateForm()) {
                                          Navigator.of(context).pushAndRemoveUntil(
                                              MaterialPageRoute(
                                                builder: (_) =>
                                                    HomeScreen(),
                                              ),
                                              (route) => false);
                                        }
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
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
