// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;


import '../Constants/api.dart';
import 'login_page.dart';
import 'login_widgets.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  String email = '';
  String password = '';
  String username = '';

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

                    // Image.asset('assets/login/logo.png'),
                    Row(
                      children: [
                        const SizedBox(
                          width: 40,
                        ),
                        Text(
                          "SIGNUP",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    LoginTextBox(
                        hintText: 'Username',
                        whenChanged: (value) {
                          username = value;
                        }),
                    LoginTextBox(
                        hintText: 'Email',
                        whenChanged: (value) {
                          email = value;
                        }),
                    LoginTextBox(
                        hintText: 'Password',
                        whenChanged: (value) {
                          password = value;
                        }),

                    InkWell(
                        onTap: () async {
                                await signUp({
                                  'username': username,
                                  'email': email,
                                  'password': password,
                                });
                                logIn({
                                  'username': username,
                                  'password': password
                                }).then((value) {
                                  // print(value);
                                  if (value == 'logged in') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Sign up successful'),
                                ),
                              );
                              Navigator.pushNamed(context, '/home');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Sign up failed'),
                                ),
                              );
                            }
                          });
                        },
                        child: LoginSubmitButton(txt: "Sign Up")),
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
                              "Already have an account?",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: const Text(
                                "Login",
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

Future<String> signUp(Map<String, dynamic> data) async {
  var url = '${Api.baseUrl}register'; // Include 'http://' or 'https://'
  String body = json.encode(data);
  print(data);
  print(url);

  try {
    var response = await http.post(
      Uri.parse(url), // Use Uri.parse to create the Uri
      body: body,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return jsonResponse['Message'];
    } else {
      // Handle other status codes (e.g., 404, 500, etc.) if needed
      return 'Error: ${response.statusCode}';
    }
  } catch (e) {
    // Handle exceptions (e.g., network errors)
    return 'Error: $e';
  }
}}
