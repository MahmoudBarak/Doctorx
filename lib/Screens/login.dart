
import 'package:custom_clippers/Clippers/sin_cosine_wave_clipper.dart';
import 'package:custom_clippers/enum/enums.dart';
import 'package:doctorx/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
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
  @override
  bool _vis = false;
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
        body: Form(
          key: _key,
          child: SafeArea(
      child: Column(

          children: [
            ClipPath(
              clipper:SinCosineWaveClipper(verticalPosition:VerticalPosition.BOTTOM ,horizontalPosition:HorizontalPosition.LEFT),
              child: Container(
                height: 120,

                color: Colors.deepPurpleAccent,

              ),
            ),
            SizedBox(
              height:50,
            ),
            Text('LOGIN',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: 25,),


            Center(
              child: Container(
                width: 300,
                height: 432,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
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
                                color: Colors.deepPurpleAccent,
                              )
                                  : Icon(
                                Icons.visibility_off,
                                color: Colors.deepPurpleAccent,
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
                            child: const Text(
                              'ForgetPassword?',
                              style: TextStyle(color: Colors.deepPurpleAccent),
                            ))),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.deepPurpleAccent),
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
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Divider(
                          color: Colors.deepPurpleAccent,
                          thickness: 10,
                        ),
                        Text('or'),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\‘t Have Account?'),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()));
                            },
                            child: const Text(
                              'Register Now',
                              style: TextStyle(color: Colors.deepPurpleAccent),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
            WaveWidget(
              config: CustomConfig(
                gradients: [
                  [Colors.deepPurpleAccent, Color(0xA00CEAFF)],
                  [Colors.deepPurpleAccent, Color(0xA00CEAFF)],
                  [Colors.deepPurpleAccent, Color(0xA00CEAFF)],
                  [Colors.deepPurpleAccent, Color(0xA00CEAFF)]
                ],
                durations: [35000, 19440, 10800, 6000],
                heightPercentages: [0.20, 0.23, 0.25, 0.30],
                blur: MaskFilter.blur(BlurStyle.solid, 10),
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ), size: Size(double.infinity,155),

            ),
          ],
      ),
    ),
        ));
  }
}
