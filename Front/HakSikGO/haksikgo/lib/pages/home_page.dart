import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

  static const storage = FlutterSecureStorage();
  dynamic userInfo = '';
  static String email = '';
  _asyncMethod() async {
    userInfo = await storage.read(key: 'login');
    if (userInfo != null) {
      email = userInfo['email'];
    }
  }
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF3873A4),
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(
          Icons.food_bank_outlined,
          color: Colors.black,
          size: 40,
        ),
        title: const Flexible(
          child: Text(
            '학식GO',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: const Color(0XFF3873A4),
        shadowColor: Colors.transparent,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'MY',
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "$email",
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
