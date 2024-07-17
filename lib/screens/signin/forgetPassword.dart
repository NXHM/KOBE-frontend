import 'package:flutter/material.dart';
import 'package:myapp/constants/icons.dart';
import 'package:myapp/constants/colors.dart';
import 'package:myapp/screens/signin/enterCode.dart';
import '../../controllers/forgetPasswordController.dart';
import 'package:get/get.dart';
import 'package:myapp/screens/widgets/description.dart';
import 'package:myapp/screens/widgets/titleInitialPages.dart';

class ForgetPassword extends StatelessWidget {
  final TextEditingController _forgetPasswordController =
      TextEditingController();
  final ForgetPasswordController forgetPasswordController =
      Get.put(ForgetPasswordController());

  ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: TDIcons.backArrow,
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(height: 20),
              const TitleInitialPages(title: '¿Te olvidaste tu contraseña?'),
              const SizedBox(height: 10),
              const Description(
                description:
                    'Ingresa tu correo electrónico vinculado para restablecer tu contraseña.',
              ),
              const SizedBox(height: 20),
              _inputFieldForgetPassword(context),
              const SizedBox(height: 20),
              _submitButton(context),
              const SizedBox(height: 10),
              _statusMessage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputFieldForgetPassword(BuildContext context) {
    return TextField(
      controller: _forgetPasswordController,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email_rounded),
        labelText: 'Correo electrónico',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          final String email = _forgetPasswordController.text.trim();
          await forgetPasswordController.sendEmail(email);
          if (forgetPasswordController.statusMessage.value ==
              "Code sent successfully") {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                    builder: (context) => EnterCode(email: email)));
          }
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          backgroundColor: TDColors.blueLogo,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: const Text('Enviar Código', style: TextStyle(fontSize: 18)),
      ),
    );
  }

  Widget _statusMessage() {
    return Obx(() => Text(
          forgetPasswordController.statusMessage.value,
          style: TextStyle(
            color: forgetPasswordController.statusMessage.value ==
                    "Código enviado exitosamente"
                ? Colors.green
                : Colors.red,
          ),
        ));
  }
}
