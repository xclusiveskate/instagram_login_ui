import 'package:flutter/material.dart';
import 'package:instagram_login_ui/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  FocusNode emailFocus = FocusNode();
  FocusNode nameFocus = FocusNode();
  FocusNode usernameFocus = FocusNode();
  FocusNode passFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    emailFocus.addListener(() {});
    nameFocus.addListener(() {});
    usernameFocus.addListener(() {});
    passFocus.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    emailFocus.removeListener;
    nameFocus.removeListener;
    usernameFocus.removeListener;
    passFocus.removeListener;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              reverse: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        // color: Colors.blue,
                        alignment: Alignment.center,
                        width: 200,
                        child: Image.asset(
                          "assets/images/instagram.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Text(
                          "Sign up to see photos and videos from your friends",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(6)),
                              alignment: Alignment.center,
                              height: 40,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 6.0),
                                    child: Icon(
                                      Icons.facebook,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Log in with Facebook",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            width: 170,
                            child: Divider(
                              height: 6,
                              indent: 15,
                              endIndent: 15,
                              color: Colors.grey,
                              thickness: 1.0,
                            ),
                          ),
                          Text("OR"),
                          SizedBox(
                            width: 170,
                            child: Divider(
                              height: 6,
                              indent: 15,
                              endIndent: 15,
                              color: Colors.grey,
                              thickness: 1.0,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: TextFormField(
                                    focusNode: emailFocus,
                                    onEditingComplete: () {
                                      setState(() {
                                        emailFocus.unfocus();
                                        nameFocus.requestFocus();
                                      });
                                    },
                                    validator: (val) {
                                      if ((val!.isNotEmpty &&
                                          val.contains('@'))) {
                                        return null;
                                      } else {
                                        return "mobile number or email needed";
                                      }
                                    },
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(6),
                                        fillColor: const Color.fromARGB(
                                            255, 244, 244, 244),
                                        filled: true,
                                        hintText: "Mobile Number or Email",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            borderSide: const BorderSide(
                                                color: Colors.black))),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: TextFormField(
                                    focusNode: nameFocus,
                                    onEditingComplete: () {
                                      usernameFocus.requestFocus();
                                    },
                                    validator: (val) {
                                      if (val!.isNotEmpty) {
                                        return null;
                                      } else {
                                        return 'name field required';
                                      }
                                    },
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(6),
                                        fillColor: const Color.fromARGB(
                                            255, 244, 244, 244),
                                        filled: true,
                                        hintText: "Full name",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            borderSide: const BorderSide(
                                                color: Colors.black))),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: TextFormField(
                                    focusNode: usernameFocus,
                                    onEditingComplete: () {
                                      passFocus.requestFocus();
                                    },
                                    validator: (val) {
                                      if (val!.isNotEmpty &&
                                          val.contains(
                                              RegExp(r'^@[a-z]{2,}'))) {
                                        return null;
                                      } else {
                                        return "Password must contains atleast 6 characters with atleast a special character";
                                      }
                                    },
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(6),
                                        fillColor: const Color.fromARGB(
                                            255, 244, 244, 244),
                                        filled: true,
                                        hintText: "Username",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            borderSide: const BorderSide(
                                                color: Colors.black))),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: TextFormField(
                                    focusNode: passFocus,
                                    onEditingComplete: () {
                                      passFocus.unfocus();
                                    },
                                    validator: (val) {
                                      if (val!.isNotEmpty && val.length >= 6) {
                                        return null;
                                      } else if (val.isNotEmpty &&
                                          val.length < 6) {
                                        return 'password must be atleast 6 characters';
                                      } else {
                                        return 'password field required';
                                      }
                                    },
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(6),
                                        fillColor: const Color.fromARGB(
                                            255, 244, 244, 244),
                                        filled: true,
                                        hintText: "Password",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            borderSide: const BorderSide(
                                                color: Colors.black))),
                                  ),
                                )
                              ],
                            )),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          textAlign: TextAlign.center,
                          "People who use our service may have uploaded your contact information to instagram. Learn More",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          textAlign: TextAlign.center,
                          "By Signing up, you agree to our terms, Privacy Policy and Cookies Policy.",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            var isValid = formKey.currentState?.validate();
                            if (isValid == true) {
                              print("Valiated");
                              formKey.currentState!.save();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LogIn()));
                            } else {
                              print("not validated");
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(6)),
                            alignment: Alignment.center,
                            height: 40,
                            width: double.infinity,
                            child: const Text(
                              "Log In",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Have an account?"),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogIn()),
                          );
                        },
                        child: const Text(
                          "Log in",
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
