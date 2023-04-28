import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
        onPressed: () {
            addUser(email.text, password.text);
        },
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
                onFieldSubmitted: (String password){},
                controller: password,
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
                onFieldSubmitted: (String email){},
                controller: email,
      ),
    );
  }
    void addUser(String email,String password){
      FirebaseAuth auth = FirebaseAuth.instance;
      auth.createUserWithEmailAndPassword(email: email, password: password).then((FirebaseUser){
          print('Usuário salvo com sucesso!');
          print('Email: ${FirebaseUser.user}');

      }).catchError((error){
        print('$error');
      });

  }
  Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
 
}
