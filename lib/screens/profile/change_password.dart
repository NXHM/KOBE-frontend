import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                  hintStyle: const TextStyle(color: Color(0XFF9299A3)),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Color(0XFF242D35),
                  ),
                  suffixIcon: const Icon(
                    Icons.visibility_outlined,
                    color: Color(0XFF9DA4AC),
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
            // # Input Confirmar contraseña
            Container(
              margin: const EdgeInsets.only(top: 26),
              decoration: BoxDecoration(
                color: const Color(0XFFF0F2F4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  hintText: 'Confirmar contraseña',
                  hintStyle: const TextStyle(color: Color(0XFF9299A3)),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Color(0XFF242D35),
                  ),
                  suffixIcon: const Icon(
                    Icons.visibility_outlined,
                    color: Color(0XFF9DA4AC),
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
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/profile/change_password/confirmation',
                    (Route<dynamic> route) => false,
                  );
                },
                child: const Text('Cambiar contraseña'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
