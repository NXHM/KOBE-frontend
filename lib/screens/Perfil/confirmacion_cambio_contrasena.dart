import 'package:flutter/material.dart';

class ConfirmacionCambioContrasena extends StatelessWidget {
  const ConfirmacionCambioContrasena({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // # Texto Título
          const Text(
            'Cambio modificado.',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          // # Texto Indicación
          Container(
            margin: const EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: const Text(
              'Se ha modificado su contraseña de manera exitosa.',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const Spacer(),
          // # Botón Guardar cambios
          Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF002060),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                minimumSize: const Size(double.infinity, 45)
              ),
              onPressed: () {},
              child: const Text('Aceptar'),
            ),
          ),
        ],
      ),
      ),
    );
  }
}