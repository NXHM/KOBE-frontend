import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

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
                'Nueva contraseña',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // # Texto Indicación
              Container(
                margin: const EdgeInsets.only(top: 25),
                child: const Text(
                  'Al crear su nueva contraseña, esta debe ser diferente de su contraseña anterior.',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              // # Input Contraseña
              Container(
                margin: const EdgeInsets.only(top: 38),
                decoration: BoxDecoration(
                  color: const Color(0XFFF0F2F4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Row(
                  children: [Text('Contraseña')],
                ),
              ),
              // # Input Confirmar contraseña
              Container(
                margin: const EdgeInsets.only(top: 26),
                decoration: BoxDecoration(
                  color: const Color(0XFFF0F2F4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Row(
                  children: [Text('Confirmar contraseña')],
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
                        context, '/profile/change_password/confirmation');
                  },
                  child: const Text('Cambiar contraseña'),
                ),
              ),
            ],
          ),
        ));
  }
}
