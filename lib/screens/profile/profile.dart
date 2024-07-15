import 'package:flutter/material.dart';
import 'package:myapp/controllers/profile/fetch_user_controller.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<User?>? user;

  void fetchUser() {
    setState(() {
      user = UserDataController().fetchUser();
    });
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
        child: SingleChildScrollView(
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
                        Container(
                            margin: const EdgeInsets.only(left: 27),
                            child: const Text('Jose Valdivia')),
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
                          Container(
                              margin: const EdgeInsets.only(left: 28),
                              child: const Text('pepe')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // # Botón Editar perfil
              Container(
                margin: const EdgeInsets.only(top: 24),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF002060),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minimumSize: const Size(double.infinity, 45)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile/edit');
                  },
                  child: const Text('Editar perfil'),
                ),
              ),
              // # Contenedor Correo
              Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    const Text(
                      'Correo',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 34),
                        child: const Text('pepe@ulima.edu.com')),
                  ],
                ),
              ),
              // # Botón Cambiar correo electrónico
              Container(
                margin: const EdgeInsets.only(top: 24),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF002060),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minimumSize: const Size(double.infinity, 45)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile/change_email');
                  },
                  child: const Text('Cambiar correo electrónico'),
                ),
              ),
              // # Botón Cerrar sesión
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC62B30),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minimumSize: const Size(double.infinity, 45)),
                  onPressed: () {},
                  child: const Text('Cerrar sesión'),
                ),
              ),
              // # Botón Cambiar contraseña
              Container(
                margin: const EdgeInsets.only(top: 11),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF002060),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minimumSize: const Size(double.infinity, 45)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile/change_password');
                  },
                  child: const Text('Cambiar contraseña'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
