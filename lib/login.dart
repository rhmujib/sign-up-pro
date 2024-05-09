import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isvisible = false;
  double _opacity = 0.0;

  void sendPasswordResetEmail(String email) {
    print("Sending password reset email to $email");
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        setState(
          () {
            _opacity = 1.0;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/login_image.png'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(seconds: 3),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 200, left: 120),
                  child: const Text(
                    "Sign in Now!",
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 30),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.3,
                        right: 20,
                        left: 20),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty || !value.contains("@")) {
                                return " Please enter your Email";
                              }
                              return null;
                            },
                            controller: _emailController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email),
                              hintText: "Enter your email",
                              fillColor: Colors.transparent,
                              filled: true,
                              labelText: 'Email',
                              labelStyle: const TextStyle(
                                color: Color.fromRGBO(14, 12, 12, 1),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                            controller: _passwordController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock_outline),
                              hintText: "Enter your password",
                              fillColor: Colors.transparent,
                              filled: true,
                              labelText: 'Password',
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isvisible = !isvisible;
                                    });
                                  },
                                  icon: Icon(isvisible
                                      ? Icons.visibility
                                      : Icons.visibility_off)),
                              labelStyle: const TextStyle(
                                color: Color.fromRGBO(14, 12, 12, 1),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            obscureText: isvisible,
                          ),
                          const SizedBox(height: 27),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Sign in",
                                style: TextStyle(
                                    color: Color(0xFFFFFFFF), fontSize: 25),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor:
                                    const Color.fromARGB(255, 206, 112, 143),
                                child: IconButton(
                                  onPressed: () {
                                    if (_formkey.currentState!.validate()) {
                                      print("Sign in Successfully");
                                      _emailController.clear();
                                      _passwordController.clear();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: const Text(
                                              'Sign in Successfully'),
                                          duration: const Duration(
                                              seconds:
                                                  4), // Duration for which Snackbar is displayed
                                          action: SnackBarAction(
                                            label: 'Close',
                                            onPressed: () {
                                              // Code to execute when action button is pressed
                                            },
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  icon: const Icon(Icons.arrow_forward),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'register');
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  String userEmail = "email@gmail.com";
                                  sendPasswordResetEmail(userEmail);
                                },
                                child: const Text(
                                  " Forgot Password",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
