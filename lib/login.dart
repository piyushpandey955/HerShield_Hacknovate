import 'package:flutter/material.dart';
import 'package:hershield_1/home.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'config.dart';
import 'dart:convert';

class Mylogin extends StatefulWidget {
  const Mylogin({super.key});

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController aadharController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  bool _isNotValidate = false;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }
  void loginUser() async{
    try {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var reqBody = {
        "email": emailController.text,
        "Password": passwordController.text,
      };
      //print(registerBody);
      var response = await http.post(
        Uri.parse(login),
        headers: {"Content-type": "application/json"},
        body: jsonEncode(reqBody),
      );
      //print("HTTP request successful");
      var jsonResponse = jsonDecode(response.body);
      print("daksh-> ${jsonResponse['status']}");
      //print(st);
      if (jsonResponse['status']) {
        //print("chla kya");
        var myToken = jsonResponse['token'];
        prefs.setString('token', myToken);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyApp()));
      } else {
        print("Something went wrong");
      }
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  } catch (e) {
    print("Error during HTTP request: $e");
  }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/login1.jpeg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 170),
              child: const Text(
                'Login To HerShield',
                style: TextStyle(color: Colors.white, fontSize: 33, fontWeight: FontWeight.w700),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.35,
                  right: 35,
                  left: 35,
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                         errorStyle:
                          const TextStyle(color: Colors.white),
                        errorText:
                          _isNotValidate ? "Enter Proper Info" : null,
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                         errorStyle:
                          const TextStyle(color: Colors.white),
                        errorText:
                          _isNotValidate ? "Enter Proper Info" : null,
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.w700),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            color: Colors.purple,
                            onPressed: () {
                               loginUser();
                            },
                            icon: const Icon(Icons.arrow_forward),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed((context), 'register');
                          },
                          child: const Text(
                            'Sign Up',
                            style:
                            TextStyle(decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Color(0xff4c505b)),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed((context), 'home');
                          },
                          child: const Text(
                            'Forget Password',
                            style:
                            TextStyle(decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Color(0xff4c505b)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
