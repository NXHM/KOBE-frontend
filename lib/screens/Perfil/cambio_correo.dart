import 'package:flutter/material.dart';

class CambioCorreo extends StatelessWidget {
  const CambioCorreo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Perfil',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: const Color(0xFFEBEDF0),
        child: Column(
          children: [
            // # Texto Título
            const Text(
              'Cambio de correo.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            // # Texto Indicación
            const Text(
              'Debe ingresar el nuevo correo a ser vinculado con esta cuenta.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            // # Contenedor Correo
            Container(
              margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
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
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 31),
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