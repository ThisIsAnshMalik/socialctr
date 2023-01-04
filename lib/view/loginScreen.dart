import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialctr/firebase/authentication.dart';
import 'package:socialctr/provider/Provider.dart';
import 'package:socialctr/view/signupScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Authentication authentication = Authentication();
    return Form(
      key: formkey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(24, 79, 168, 10),
          automaticallyImplyLeading: false,
          title: const Text("Login Screen"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                key: const Key("login_email_key"),
                controller: _emailController,
                decoration: const InputDecoration(
                    labelText: "email",
                    hintText: "enter email",
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "email should not be empty";
                  } else if (!value.endsWith("@gmail.com")) {
                    return "enter a valid email";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                key: const Key("login_password_key"),
                controller: _passwordController,
                decoration: const InputDecoration(
                    labelText: "password",
                    hintText: "enter password",
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "password should not be empty";
                  } else if (value.length < 6) {
                    return "password is short";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Consumer<LoadingProvider>(
              builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: InkWell(
                    key: const Key("login_button_key"),
                    onTap: (() {
                      if (formkey.currentState!.validate()) {
                        value.setLoading(true);
                        authentication.login(_emailController.text,
                            _passwordController.text, context);
                      }
                    }),
                    child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(24, 79, 168, 10),
                        ),
                        child: value.isloading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : const Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't Have an acount?  ",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                InkWell(
                  onTap: (() {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return const SignUpScreen();
                    }));
                  }),
                  child: const Text(
                    "Sign up",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
