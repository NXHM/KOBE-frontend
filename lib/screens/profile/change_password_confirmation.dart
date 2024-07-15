import 'package:flutter/material.dart';

class ChangePasswordConfirmation extends StatelessWidget {
  const ChangePasswordConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // # Texto Título
              const Text(
                'Cambio realizado',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // # Texto Indicación
              Container(
                margin: const EdgeInsets.only(top: 25),
                child: const Text(
                  'Se ha modificado su contraseña de manera exitosa.',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const Spacer(),
              // # Botón Aceptar
              Container(
                margin: const EdgeInsets.only(bottom: 31),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF002060),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minimumSize: const Size(double.infinity, 45)),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/profile',
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: const Text('Aceptar'),
                ),
              ),
            ],
          ),
        ));
  }
}
