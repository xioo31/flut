import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // State variable to hold validation error message
  String errorMessage = '';

  void _signUp() {
    if (_validateFields()) {
      _performSignUp();
    }
  }

  bool _validateFields() {
    if (fullNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      // Update the error message
      setState(() {
        errorMessage = 'Please Fill All';
      });
      return false;
    } else {
      // Clear the error message
      setState(() {
        errorMessage = '';
      });
      return true;
    }
  }

  void _performSignUp() {
    String fullName = fullNameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    // Implement your sign-up logic here
    // You can make an HTTP request to your backend for user registration

    print('Full Name: $fullName, Email: $email, Password: $password');
    // Handle sign-up logic, navigate to the home screen, etc.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Container(
        color: Colors.cyan.shade100,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: fullNameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  icon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 14),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  icon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 14),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              SizedBox(height: 10), // Space between text fields and error message
              // Display error message in red text
              Text(
                errorMessage,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 20), // Space between error message and button
              ElevatedButton(
                onPressed: _signUp,
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(Size(100, 45)),
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
