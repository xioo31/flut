import 'package:flutter/material.dart';
import 'signup.dart';
import 'package:usersinterface/model/user.dart';
import 'package:usersinterface/model/api_response.dart';
import 'package:usersinterface/services/user_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyLogin());
}

class MyLogin extends StatelessWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  bool loading = false;

  Future<void> loginUser() async {
    ApiResponse response = await login(txtEmail.text, txtPassword.text);

    if (response.error == null) {
      _saveAndRedirectToHome(response.data as User);
    } else {
      setState(() {
        loading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${response.error}')),
      );
    }
  }

  Future<void> _saveAndRedirectToHome(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', user.token ?? '');
    await prefs.setInt('userId', user.id ?? 0);

    // Navigator.of(context).pushAndRemoveUntil(
    //   MaterialPageRoute(builder: (context) => UserPage()),
    //   (route) => false,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Container(
        color: Colors.cyan.shade100,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo image
              Image.asset(
                "assets/logo2.png", // Replace 'assets/logo.png' with your image path
                height: 150, width: 150, // Adjust the height as needed
              ),
              SizedBox(height: 5),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 11),
              Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: txtEmail,
                        decoration: textBoxStyle("Enter your email", "Email", Icons.email),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email!';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 9),
                      TextFormField(
                        controller: txtPassword,
                        obscureText: true,
                        decoration: textBoxStyle("Enter your password", "Password", Icons.lock),
                        validator: (String? value) {
                          if (value == null || value.isEmpty || value.length < 6) {
                            return 'Please enter your password!';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20), // Adjust the height as needed
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                          loginUser();
                        });
                      }
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(Size(120, 45)),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 20), // Adjust the width as needed
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(Size(120, 45)),
                    ),
                    child: const Text(
                      'SignUp',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration textBoxStyle(String hintText, String label, IconData iconData) {
    return InputDecoration(
      hintText: hintText,
      labelText: label,
      prefixIcon: Icon(iconData),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
      ),
    );
  }
}
