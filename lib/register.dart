import 'package:flutter/material.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  final _Formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  double _Opacityy = 0.0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _Opacityy = 1.0;
      });
    });
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/sign_image.jpeg'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: AnimatedOpacity(
          opacity: _Opacityy,
          duration: const Duration(seconds: 3),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 200, left: 115),
                  child: const Text(
                    "Create Account",
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 30),
                  ),
                ),
                SingleChildScrollView(
                  child: Form(
                    key: _Formkey,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.3,
                          right: 20,
                          left: 20),
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return " Enter your name";
                              }
                              return null;
                            },
                            controller: _nameController,
                            decoration: InputDecoration(
                              icon: const Icon(Icons.person),
                              fillColor: const Color(0xFFFFD5EB),
                              filled: true,
                              labelText: 'Name',
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
                              if (value!.isEmpty || !value.contains("@")) {
                                return " Enter a valid Email";
                              }
                              return null;
                            },
                            controller: _emailController,
                            decoration: InputDecoration(
                              icon: const Icon(Icons.email),
                              fillColor: const Color(0xFFFFD5EB),
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
                              if (value!.length < 8) {
                                return "Requires 8 characters atleast";
                              }
                              return null;
                            },
                            controller: _passwordController,
                            decoration: InputDecoration(
                              icon: const Icon(Icons.lock),
                              fillColor: Color(0xFFFFD5EB),
                              filled: true,
                              labelText: 'Password',
                              labelStyle: const TextStyle(
                                color: Color.fromRGBO(14, 12, 12, 1),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            obscureText: true,
                          ),
                          const SizedBox(height: 27),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Color(0xFFFFFFFF), fontSize: 25),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor:
                                    const Color.fromARGB(255, 206, 112, 143),
                                child: IconButton(
                                  onPressed: () {
                                    if (_Formkey.currentState!.validate()) {
                                      print("Sign up Successfully");
                                      _nameController.clear();
                                      _emailController.clear();
                                      _passwordController.clear();
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
                                  Navigator.pushNamed(context, 'login');
                                },
                                child: const Text(
                                  "Sign in",
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
