import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import '../Constants/api.dart';
import 'login_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/login/login_background.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: ListView(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 200),
                    Row(
                      children: [
                        const SizedBox(
                          width: 40,
                        ),
                        Text(
                          "LOGIN",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    LoginTextBox(
                        hintText: 'username',
                        whenChanged: (value) {
                          username = value;
                        }),
                    LoginTextBox(
                        hintText: 'Password',
                        whenChanged: (value) {
                          password = value;
                        }),
                    Container(
                      margin: const EdgeInsets.only(top: 15, right: 50),
                      alignment: Alignment.centerRight,
                      child: Text(
                        "forgot password?",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    InkWell(
                        onTap: () async {
                          print("username: $username");
                          print("Password: $password");
                          logIn({
                                  'username': username,
                                  'password': password
                                }).then((value) {
                                  // print(value);
                                  if (value == 'logged in') {
                            () {
                              Navigator.pushNamed(context, '/home');
                            };
                          } else {
                            print("Sign-in failed");
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Sign-in failed'),
                            ));
                          }
                        });},
                        child: LoginSubmitButton(txt: "Login"),),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 50,
                          right: 50,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/signup');
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Color(0xFFEC7F1B),
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Function to sign in with username and password
Future<String> logIn(Map<String, dynamic> data) async {
  var url = '${Api.baseUrl}login'; // Include 'http://' or 'https://'
  String body = json.encode(data);
  print(data);
  print(url);
  // print(Api.user);

  try {
    var response = await http.post(
      Uri.parse(url), // Use Uri.parse to create the Uri
      body: body,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    // print(response.statusCode);
    // print(body);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      // print(jsonResponse['response']);
      // Api.token = jsonResponse['token'] ;
      Api().tokenchange(jsonResponse['token']);
      print(Api.token);

      auth();
      return jsonResponse['response'];
    } else {
      // Handle other status codes (e.g., 404, 500, etc.) if needed
      print(response.statusCode);
      return 'Error: ${response.statusCode}';
    }
  } catch (e) {
    print(e);
    // Handle exceptions (e.g., network errors)
    return 'Error: $e';
  }
}

void auth() async {
  final url = Uri.parse("${Api.baseUrl}welcome");
  final response =
      await http.get(url, headers: {'Authorization': 'Token ${Api.token}'});
  print(response.body);
  print("auth");
  var a = jsonDecode(response.body);
  Api().login(a['user'],a["userid"]);
  print(Api.user);
  // return response;
}