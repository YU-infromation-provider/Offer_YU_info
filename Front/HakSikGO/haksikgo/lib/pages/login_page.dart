import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:haksikgo/models/model.dart';
import 'package:haksikgo/pages/home_page.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LogIn();
  }
}

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController IDController = TextEditingController();
  final TextEditingController PWController = TextEditingController();

  static const storage = FlutterSecureStorage();
  dynamic userInfo = '';

  Future<void> sendData() async {
    var response = await http.post(
      Uri.parse('http://localhost:8080/user/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': IDController.text,
        'password': PWController.text,
      }),
    );

    if (response.body == '200') {
      var val = jsonEncode(Login(IDController.text, PWController.text));

      await storage.write(
        key: 'login',
        value: val,
      );
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF3873A4),
      appBar: AppBar(
        centerTitle: true,
        leading: InkResponse(
          onTap: () {
            Navigator.pop(context);
          },
          containedInkWell: false,
          highlightColor: Colors.grey,
          radius: 24,
          child: const Icon(
            Icons.food_bank_outlined,
            color: Colors.black,
            size: 40,
          ),
        ),
        title: const Text(
          '마이 페이지',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: const Color(0XFF3873A4),
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Form(
            child: Container(
              padding: const EdgeInsets.all(40.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: IDController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        fillColor: Color.fromARGB(255, 199, 195, 195),
                        filled: true,
                        hintText: 'Your email address',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: PWController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        fillColor: Color.fromARGB(255, 199, 195, 195),
                        filled: true,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: sendData,
                          /*() {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: const Text(
                                    '아이디 또는 비밀번호를 확인하세요.',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                  actions: <Widget>[
                                    InkResponse(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      containedInkWell: false,
                                      highlightColor: Colors.grey,
                                      radius: 24,
                                      child: const Text(
                                        'OK',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                  backgroundColor: const Color(0xFFDDE5E1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                );
                              },
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            shadowColor:
                                MaterialStateProperty.all(Colors.transparent),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                          ),*/
                          child: const Text(
                            'Sign in',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Text(
                          " / ",
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            '비밀번호를 찾고 싶어요',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
