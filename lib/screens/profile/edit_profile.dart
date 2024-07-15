import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _nameController = TextEditingController();
  final _userController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _userController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBEDF0),
      appBar: AppBar(
        title: const Text(
          'Perfil',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            // # Contenedor Nombre Usuario
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  // ## Fila Nombre
                  Row(
                    children: [
                      const Text(
                        'Nombre',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Container(
                            margin: const EdgeInsets.only(left: 27),
                            height: 21,
                            child: TextField(
                              controller: _nameController,
                            )),
                      )
                    ],
                  ),
                  // ## Fila Usuario
                  Container(
                    margin: const EdgeInsets.only(top: 19),
                    child: Row(
                      children: [
                        const Text(
                          'Usuario',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(left: 28),
                              height: 21,
                              child: TextField(
                                controller: _userController,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // # Botón Guardar cambios
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
                  Navigator.pop(context, '/profile');
                },
                child: const Text('Guardar cambios'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
