import 'package:flutter/material.dart';
import 'package:myapp/constants/icons.dart';
import 'package:myapp/controllers/profile/user_controller.dart';

class ChangeEmail extends StatefulWidget {
  const ChangeEmail({super.key});

  @override
  State<ChangeEmail> createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: TDIcons.backArrow,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Nuevo correo electrónico',
                  hintStyle: const TextStyle(color: Color(0XFF9299A3)),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Color(0XFF242D35),
                  ),
                  filled: true,
                  fillColor: const Color(0XFFF0F2F4),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0XFFBFC0C3)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
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
                  minimumSize: const Size(double.infinity, 45),
                ),
                onPressed: () {
                  UserController().putEmail(_emailController.text);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/profile/change_email/confirmation',
                    (Route<dynamic> route) => false,
                  );
                },
                child: const Text('Cambiar correo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
