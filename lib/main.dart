import 'package:flutter/material.dart';
import '/HomePage.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  final HomePage _homePage = HomePage(); // Buat objek TaskList
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),     
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),              
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                width: 150,
                height: 150,
              ),
              SizedBox(height: 10),
              Text(
                'TRAVELOURS',
                style: TextStyle(fontSize: 23,            
                )
              ),
              SizedBox(height: 20),
              TextField(
                // controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter your username'
                ),
              ),
              SizedBox(height: 10),
              TextField(
                // controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                   hintText: 'Enter your password'
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  //auth
                  // String username = usernameController.text;
                  // String password = passwordController.text;

                  // print('Username: $username');
                  // print('Password: $password');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text('SIGN IN'),
                style: OutlinedButton.styleFrom(
                  primary: Colors.black, // Warna teks dan border tombol
                  backgroundColor: Colors.blue,
                  fixedSize: Size(400, 50),
                  padding: EdgeInsets.all(16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


