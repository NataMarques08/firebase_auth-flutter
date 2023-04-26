import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          buildTextFormFieldEmail(),
          buildTextFormFieldPassword(),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: loginButton(),
          ),
        ],
      ),
    );
  }

  Padding loginButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Login'),
      ),
    );
  }

  Padding buildTextFormFieldPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, left: 5.0, right: 5.0),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        decoration: const InputDecoration(
            labelStyle: TextStyle(color: Colors.black),
            labelText: "Senha",
            hintText: "Sua senha",
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black))),
      ),
    );
  }

  Padding buildTextFormFieldEmail() {
    return Padding(
      padding: const EdgeInsets.only(top: 58.0, left: 5.0, right: 5.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            labelStyle: TextStyle(color: Colors.black),
            labelText: "Email",
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black))),
      ),
    );
  }
}
