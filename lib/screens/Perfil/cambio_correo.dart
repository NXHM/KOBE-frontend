import 'package:flutter/material.dart';

class CambioCorreo extends StatelessWidget {
  const CambioCorreo({super.key});

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
            'Cambio de correo.',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          // # Texto Indicación
          Container(
            margin: const EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: const Text(
              'Debe ingresar el nuevo correo a ser vinculado con esta cuenta.',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          // # Contenedor Correo
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(0, 68, 0, 0),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F2F4),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text(
              'Nuevo correo electrónico',
              style: TextStyle(fontWeight: FontWeight.bold),
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
              child: const Text('Cambiar correo'),
            ),
          ),
        ],
      ),
      ),
    );
  }
}