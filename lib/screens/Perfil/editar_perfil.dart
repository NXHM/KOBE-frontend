import 'package:flutter/material.dart';

class EditarPerfil extends StatelessWidget {
  const EditarPerfil({super.key});

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
            // # Contenedor Nombre Usuario
            Container(
              margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  // # Fila Nombre
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Row(
                      children: [
                        const Text(
                          'Nombre',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(27, 0, 0, 0),
                          child: const Text('Jose Valdivia')
                        ),
                      ],
                    ),
                  ),
                  // # Fila usuario
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 19, 0, 0),
                    child: Row(
                      children: [
                        const Text(
                          'Usuario',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(28, 0, 0, 0),
                          child: const Text('pepe')
                        ),
                      ],
                    ),
                  ),
                ],
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
                child: const Text('Guardar cambios'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}