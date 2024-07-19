import 'package:flutter/material.dart';
import 'package:myapp/entities/User.dart';
import 'package:myapp/controllers/profile/user_controller.dart';
import 'package:myapp/constants/icons.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _nameFieldController = TextEditingController();
  final _userFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFEBEDF0),
      appBar: AppBar(
        leading: IconButton(
          icon: TDIcons.backArrow,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Perfil',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: FutureBuilder<User>(
            future: UserController().getUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                _nameFieldController.text = snapshot.data!.name!;
                _userFieldController.text = snapshot.data!.username!;
                return Column(
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
                                    controller: _nameFieldController,
                                    style: const TextStyle(fontSize: 14),
                                    decoration:
                                        const InputDecoration(isDense: true),
                                  ),
                                ),
                              ),
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
                                    margin: const EdgeInsets.only(left: 27),
                                    height: 21,
                                    child: TextField(
                                      controller: _userFieldController,
                                      style: const TextStyle(fontSize: 14),
                                      decoration:
                                          const InputDecoration(isDense: true),
                                    ),
                                  ),
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
                      margin: const EdgeInsets.only(bottom: 31),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF002060),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          minimumSize: const Size(double.infinity, 45),
                        ),
                        onPressed: () async {
                          UserController().putUser(_nameFieldController.text,
                              _userFieldController.text);
                          await Future.delayed(
                            const Duration(milliseconds: 500),
                          );
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/home',
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: const Text('Guardar cambios'),
                      ),
                    ),
                  ],
                );
              }
            }),
      ),
    );
  }
}
