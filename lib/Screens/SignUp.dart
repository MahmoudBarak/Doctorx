import 'package:custom_clippers/Clippers/sin_cosine_wave_clipper.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'BottomNavigation.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                  height: 100,
                ),

                Center(
                    child: Container(
                        width: 300,
                        height: 500,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                validator: (firstname)=>firstname!.isEmpty?'First Name be Can\‘t embty':null,
                              decoration: InputDecoration(
                                  hintText: 'First Name',
                                  hintStyle:
                                  TextStyle(color: Colors.grey.shade400),
                                  border: const OutlineInputBorder()),
                            ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                validator: (lastname)=>lastname!.isEmpty?'Last Name be Can\‘t embty':null,
                                decoration: InputDecoration(
                                    hintText: 'Last Name',
                                    hintStyle:
                                        TextStyle(color: Colors.grey.shade400),
                                    border: const OutlineInputBorder()),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _email,
                                validator: (email)=>email!.isEmpty?'Email Can\‘t be Empty':null,

                                decoration: InputDecoration(
                                    hintText: 'Email',
                                    hintStyle:
                                        TextStyle(color: Colors.grey.shade400),
                                    border: const OutlineInputBorder()),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
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
                                            ? const Icon(
                                          Icons.visibility,
                                          color: Colors.deepPurpleAccent,
                                        )
                                            : const Icon(
                                          Icons.visibility_off,
                                          color: Colors.deepPurpleAccent,
                                        )
                                    ),

                                    border: const OutlineInputBorder(),
                                    hintText: "Password",
                                    hintStyle:
                                        TextStyle(color: Colors.grey.shade400)),
                              ),
                              const SizedBox(height: 20,),
                              Container(
                                width:double.infinity,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.deepPurpleAccent),
                                child: TextButton(
                                  onPressed: () {
                                    if(_validateForm()){
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                            builder: (_) =>BottomNavigationbar(),
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
          ),
        ));
  }
}
