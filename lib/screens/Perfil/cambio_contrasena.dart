import 'package:flutter/material.dart';

class CambioContrasena extends StatelessWidget {
  const CambioContrasena({super.key});

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
            'Nueva contraseña',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          // # Texto Indicación
          Container(
            margin: const EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: const Text(
              'Al crear su nueva contraseña, esta debe ser diferente de su contraseña anterior.',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          // # Contenedor Contraseña
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(0, 38, 0, 0),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F2F4),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text(
              'Contraseña',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          // # Contenedor Confirmar contraseña
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(0, 26, 0, 0),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F2F4),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text(
              'Confirmar contraseña',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 27, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Debe tener al menos 8 caracteres.'
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                  child: const Text(
                    'Contiene al menos un número.'
                  ),
                )
            ],)
          ),
          const Spacer(),
          // # Botón Cambiar correo
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
              child: const Text('Cambiar contraseña'),
            ),
          ),
        ],
      ),
      ),
    );
  }
}