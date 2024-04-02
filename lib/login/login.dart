import 'package:flutter/material.dart';
import 'package:filmes/homepage.dart';

class login extends StatefulWidget {
  const login({super.key});


  @override
  State<login> createState() => _MyWidgetState();
}
 String usuario = '';
 String senha = '';

class _MyWidgetState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Tela de Login',
            style: TextStyle(fontSize: 25,
            color: Colors.black)),
            const SizedBox(height: 15),
                Center(
                 child: TextField(
                  onChanged: (text) {
                    usuario = text;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Usuário',
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(),
                  constraints: BoxConstraints(maxWidth: 380)
                  ),
                  style: const TextStyle(color: Colors.black),
                  ),
               ),
               const SizedBox(height: 15),
               TextField(
                onChanged: (text) {
                  senha = text;
                },
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                constraints: BoxConstraints(maxWidth: 380)
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 15),
              ElevatedButton(onPressed: () {
                if (usuario == 'jcse' && senha == '1234') {
                  Navigator.pushNamed(context, 'homepage');
                } else{
                  print('Usuário ou Senha incorretos');
                }
              },
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black),
                minimumSize: MaterialStatePropertyAll(Size(120, 50))),
                 child: const Text(
                'Entrar',
                style: TextStyle(color: Colors.white),))
        ],
      ),
    );
  }
}