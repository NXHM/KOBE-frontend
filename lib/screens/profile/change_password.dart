import 'package:flutter/material.dart';
import 'package:myapp/constants/icons.dart';
import 'package:myapp/controllers/profile/user_controller.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _passwordFieldController = TextEditingController();
  final _confirmPasswordFieldController = TextEditingController();
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool passwordsMatch = false;
  bool hasDesiredLength = false;
  bool hasUpperLower = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;
  bool validation = false;

  void validatePasswords() {
    final password = _passwordFieldController.text;
    final confirmPassword = _confirmPasswordFieldController.text;

    setState(() {
      passwordsMatch = password == confirmPassword;
      hasDesiredLength = password.length > 7 && password.length < 13;
      hasUpperLower = password.contains(RegExp(r'[A-Z]')) &&
          password.contains(RegExp(r'[a-z]'));
      hasNumber = password.contains(RegExp(r'[0-9]'));
      hasSpecialCharacter =
          password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
      validation = passwordsMatch &&
          hasDesiredLength &&
          hasUpperLower &&
          hasNumber &&
          hasSpecialCharacter;
    });
  }

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
        child: SingleChildScrollView(
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
                  controller: _passwordFieldController,
                  onChanged: (value) {
                    validatePasswords();
                  },
                  obscureText: obscurePassword,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    hintStyle: const TextStyle(color: Color(0XFF9299A3)),
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Color(0XFF242D35),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
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
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
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
                  controller: _confirmPasswordFieldController,
                  onChanged: (value) {
                    validatePasswords();
                  },
                  obscureText: obscureConfirmPassword,
                  decoration: InputDecoration(
                    hintText: 'Confirmar contraseña',
                    hintStyle: const TextStyle(color: Color(0XFF9299A3)),
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Color(0XFF242D35),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscureConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          obscureConfirmPassword = !obscureConfirmPassword;
                        });
                      },
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
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                  ),
                ),
              ),
              const SizedBox(height: 27),
              // # Passwords validations
              Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: hasDesiredLength
                        ? Colors.blue
                        : const Color(0XFF9BA1A8),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Entre 8 y 12 caracteres.',
                    style: TextStyle(
                      color: hasDesiredLength
                          ? Colors.blue
                          : const Color(0XFF9BA1A8),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color:
                        hasUpperLower ? Colors.blue : const Color(0XFF9BA1A8),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Al menos una mayúscula y una minúscula.',
                    style: TextStyle(
                      color:
                          hasUpperLower ? Colors.blue : const Color(0XFF9BA1A8),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: hasNumber ? Colors.blue : const Color(0XFF9BA1A8),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Al menos un número.',
                    style: TextStyle(
                      color: hasNumber ? Colors.blue : const Color(0XFF9BA1A8),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: hasSpecialCharacter
                        ? Colors.blue
                        : const Color(0XFF9BA1A8),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Al menos un caracter especial.',
                    style: TextStyle(
                      color: hasSpecialCharacter
                          ? Colors.blue
                          : const Color(0XFF9BA1A8),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color:
                        passwordsMatch ? Colors.blue : const Color(0XFF9BA1A8),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Contraseñas coinciden.',
                    style: TextStyle(
                      color: passwordsMatch
                          ? Colors.blue
                          : const Color(0XFF9BA1A8),
                    ),
                  ),
                ],
              ),
              // # Botón Cambiar correo
              Container(
                margin: const EdgeInsets.only(top: 89, bottom: 31),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: validation
                        ? const Color(0xFF002060)
                        : const Color(0XFFBFC0C3),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minimumSize: const Size(double.infinity, 45),
                  ),
                  onPressed: () {
                    if (validation) {
                      UserController()
                          .putPassword(_passwordFieldController.text);
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/profile/change_password/confirmation',
                        (Route<dynamic> route) => false,
                      );
                    }
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
