import 'package:doctorx/Screens/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SignUp.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();

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
      child: Center(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/logo.png'),
                  backgroundColor: Colors.grey.shade200,
                ),
                SizedBox(height:100,),

                Center(
                  child: Container(
                    width: 300,
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          style:Theme.of(context).textTheme.bodyText1,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          controller: _email,
                          validator: (email)=>email!.isEmpty?'Email Can\‘t  be Empty':null,

                          decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              border:OutlineInputBorder(borderRadius: BorderRadius.circular(29))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          style:Theme.of(context).textTheme.bodyText1,

                          textInputAction: TextInputAction.done,
                          validator: (password)=>password!.isEmpty?'Password Can\‘t be Empty ':null,
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
                                    color: Theme.of(context).primaryColor,
                                  )
                                      : Icon(
                                    Icons.visibility_off,
                                    color: Theme.of(context).primaryColor,
                                  )
                              ),
                              border:OutlineInputBorder(borderRadius: BorderRadius.circular(29)),
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey.shade400)),
                        ),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                                onPressed: () {},
                                child:  Text(
                                  'ForgetPassword?',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ))),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Theme.of(context).primaryColor),
                          child: TextButton(
                              onPressed: () {
                                if(_validateForm()){
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (_) =>HomeScreen(),
                                      ),
                                          (route) => false);


                                }
                              },
                              child:  Text(
                                'Login',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Divider(
                              color: Colors.deepPurpleAccent,
                              thickness: 10,
                            ),
                            Text('or',style:Theme.of(context).textTheme.bodyText1 ,),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\‘t Have Account?',style: Theme.of(context).textTheme.bodyText1,),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const SignUp()));
                                },
                                child:  Text(
                                  'Register Now',
                                  style: TextStyle(color: Theme.of(context).primaryColor),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
          ),
        ),
      ),
    ),
        ));
  }
}
