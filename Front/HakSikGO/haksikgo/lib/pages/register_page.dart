import 'package:flutter/material.dart';
import 'package:haksikgo/pages/home_page.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const RegisterApp());
}

class RegisterApp extends StatelessWidget {
  const RegisterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Register();
  }
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _LogInState();
}

class _LogInState extends State<Register> {
  final TextEditingController reg_EmailController = TextEditingController();
  final TextEditingController reg_UserNameController = TextEditingController();
  final TextEditingController reg_PWController = TextEditingController();
  final TextEditingController reg_PWConfirmController = TextEditingController();
  Future<void> reg_sendData() async {
    //이메일 형식의 타당성을 검사해줌 젤 먼저 (옳지않은 형식이나 비어있는 경우임)
    bool isValidEmail = RegExp(r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
        .hasMatch(reg_EmailController.text);
    if (!isValidEmail || reg_EmailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('이메일 형식이 유효하지 않습니다.')),
      );
      return; // 이메일 형식이 유효하지 않으면 종료
    }
    //username이 공백인지도 검사해줌
    if (reg_UserNameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('사용자 이름을 입력해주세요.')),
      );
      return; // 공백이면 함수를 여기서 종료
    }

    // 비밀번호와 비밀번호 확인이 일치하는지 검사
    if (reg_PWController.text != reg_PWConfirmController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('비밀번호가 일치하지 않습니다.')),
      );
      return; // 일치하지 않으면 종료
    }

    // 비밀번호 타당성 검사 (예시: 최소 8자 이상, 최소 하나의 숫자, 하나의 특수 문자 포함)
    bool isValidPassword = RegExp(
            r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$')
        .hasMatch(reg_PWController.text);
    if (!isValidPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('비밀번호가 타당성 요구사항을 충족하지 않습니다.')),
      );
      return; // 비밀번호가 요구사항을 충족하지 않으면 함수를 여기서 종료
    }

    try {
      var response = await http.post(
        Uri.parse('http://localhost:8080/user/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            'email': reg_EmailController.text,
            'username': reg_UserNameController.text,
            'password': reg_PWController.text,
          },
        ),
      );

      // 상태 코드를 확인하여 성공적인 요청인지 검사
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // 200~299까지가 성공한 응답
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        // 서버 응답에 따른 에러 처리
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('회원가입에 실패했습니다. 에러 코드: ${response.statusCode}')),
        );
      }
    } catch (e) {
      // 예외 처리
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('오류가 발생했습니다. 다시 시도해주세요.')),
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
            Icons.arrow_back,
            color: Colors.black,
            size: 40,
          ),
        ),
        backgroundColor: const Color(0XFF3873A4),
        shadowColor: Colors.transparent,
        title: const Text(
          "회원가입",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            const Center(
              child: Text(
                "Email",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: TextField(
                expands: false,
                controller: reg_EmailController,
                decoration: const InputDecoration(
                  fillColor: Color.fromARGB(255, 199, 195, 195),
                  filled: true,
                  hintText: '이메일 주소를 입력해주세요.',
                  hintStyle: TextStyle(fontSize: 13),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                "Username",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: TextField(
                expands: false,
                controller: reg_UserNameController,
                decoration: const InputDecoration(
                  fillColor: Color.fromARGB(255, 199, 195, 195),
                  filled: true,
                  hintText: '사용하실 UserName을 입력해주세요.',
                  hintStyle: TextStyle(fontSize: 13),
                ),
                keyboardType: TextInputType.name,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                "Password",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: TextField(
                expands: false,
                controller: reg_PWController,
                decoration: const InputDecoration(
                  fillColor: Color.fromARGB(255, 199, 195, 195),
                  filled: true,
                  hintText: '규칙: 최소 8자 이상, 최소 하나의 숫자, 하나의 특수 문자 포함',
                  hintStyle: TextStyle(fontSize: 13),
                ),
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                "Password(Confirm)",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: TextField(
                expands: false,
                controller: reg_PWConfirmController,
                decoration: const InputDecoration(
                  fillColor: Color.fromARGB(255, 199, 195, 195),
                  filled: true,
                  hintText: '확인용 다시 한번 입력',
                  hintStyle: TextStyle(fontSize: 13),
                ),
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: reg_sendData,
                child: const Text(
                  '회원가입',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    backgroundColor: Color.fromARGB(255, 189, 217, 240),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
