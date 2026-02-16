import 'package:flutter/material.dart';
class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              const Text(
                "Inscription",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Créez un compte, c'est gratuit",
                style: TextStyle(fontSize: 15, color: Colors.grey[700]),
              ),
              const SizedBox(height: 30),

            
              _inputField(label: "Nom d'utilisateur"),
              const SizedBox(height: 20),
              _inputField(label: "Email"),
              const SizedBox(height: 20),
              _inputField(label: "Mot de passe", obscureText: true),
              const SizedBox(height: 20),
              _inputField(label: "Confirmer le mot de passe", obscureText: true),
              const SizedBox(height: 30),

        
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xff0095FF),
                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(
                    "S'inscrire",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Avez-vous déjà un compte? "),
                  Text(
                    "Connecte-toi",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.blue,
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
}


Widget _inputField({required String label, bool obscureText = false}) {
  return TextField(
    obscureText: obscureText,
    decoration: InputDecoration(
      labelText: label,
      hintText: "Entrer votre $label",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
