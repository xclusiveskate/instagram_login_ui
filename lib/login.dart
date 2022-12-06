import 'package:flutter/material.dart';
import 'package:instagram_login_ui/reset.dart';
import 'package:instagram_login_ui/signup.dart';

class LogIn extends StatefulWidget {
  const LogIn({
    super.key,
  });

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  _LogInState() {
    defaultLanguage = language.first;
  }
  String defaultLanguage = "";
  List language = ["English(india)", "English(USA)", "English(UK)", "French"];

  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();

  bool isPassword = false;
  @override
  void initState() {
    super.initState();
    // emailController.addListener(() {
    //   if (emailController.text.isNotEmpty) {
    //     var email = emailController.text;
    //     print(email);
    //   }
    // });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.clear();
    emailController.dispose();
    emailController.removeListener;
    passController.clear();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: DropdownButton(
                      value: defaultLanguage,
                      items: language
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          defaultLanguage = val as String;
                        });
                      }),
                ),
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 75,
                        child: isKeyboard
                            ? Image.asset("assets/images/instagram.png")
                            : null,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                    // controller: emailController,
                                    validator: (value) {
                                      if (value!.isNotEmpty &&
                                          value.contains("@")) {
                                        return null;
                                      } else {
                                        return "Invalid Email Address";
                                      }
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        hintText:
                                            "Phone number, email or username",
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.blue, width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10)))),
                                const SizedBox(
                                  height: 25,
                                ),
                                TextFormField(
                                  obscuringCharacter: "*",
                                  obscureText: isPassword ? false : true,
                                  controller: passController,
                                  validator: (value) {
                                    if (value!.isNotEmpty &&
                                        value.length >= 7) {
                                      return null;
                                    } else {
                                      return "Password must be atleast 7 Characters";
                                    }
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.blue, width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isPassword = !isPassword;
                                          });
                                        },
                                        icon: isPassword
                                            ? const Icon(
                                                Icons.remove_red_eye_outlined)
                                            : const Icon(Icons.remove_red_eye)),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            var isValid = formKey.currentState?.validate();
                            if (isValid == true) {
                              print("Valiated");
                            } else {
                              print("not validated");
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            height: 50,
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
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Forgot your login details?"),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => const Reset())));
                            },
                            child: const Text(
                              "Get help logging in.",
                              style: TextStyle(
                                  // fontSize: 20,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            width: 180,
                            child: Divider(
                              height: 5,
                              indent: 15,
                              endIndent: 15,
                              color: Colors.black,
                            ),
                          ),
                          Text("OR"),
                          SizedBox(
                            width: 180,
                            child: Divider(
                              height: 5,
                              indent: 15,
                              endIndent: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        child: const Text(
                          "Log in with Facebook",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()));
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
