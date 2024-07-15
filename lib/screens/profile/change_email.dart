import 'package:flutter/material.dart';

class ChangeEmail extends StatelessWidget {
  const ChangeEmail({super.key});

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
                'Cambio de correo',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // # Texto Indicación
              Container(
                margin: const EdgeInsets.only(top: 25),
                child: const Text(
                  'Debe ingresar el nuevo correo a ser vinculado con esta cuenta.',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              // # Input Correo electrónico
              Container(
                margin: const EdgeInsets.only(top: 68),
                decoration: BoxDecoration(
                  color: const Color(0XFFF0F2F4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Row(
                  children: [Text('Cambiar correo electrónico')],
                ),
              ),
              const Spacer(),
              // # Botón Cambiar correo
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
                    Navigator.pushNamed(
                        context, '/profile/change_email/confirmation');
                  },
                  child: const Text('Cambiar correo'),
                ),
              ),
            ],
          ),
        ));
  }
}
