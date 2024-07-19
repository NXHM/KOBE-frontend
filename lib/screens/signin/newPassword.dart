import 'package:flutter/material.dart';
import 'package:myapp/constants/icons.dart';
import 'package:myapp/screens/signin/succesfulChangePassword.dart';
import '../../controllers/newPasswordController.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/colors.dart';
import 'package:myapp/screens/widgets/description.dart';
import 'package:myapp/screens/widgets/titleInitialPages.dart';

class NewPassword extends StatelessWidget {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _newRepeatPasswordController =
      TextEditingController();
  final NewPasswordController newPasswordController =
      Get.put(NewPasswordController());
  final String email;

  NewPassword({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
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
                    const TitleInitialPages(title: 'Nueva Contraseña'),
                    const SizedBox(height: 10),
                    const Description(
                      description: 'Al crear su nueva contraseña, debe ser diferente de su contraseña anterior.',
                    ),
                    const SizedBox(height: 30),
                    _inputFieldsPassword(context),
                    const SizedBox(height: 30),
                    _submitButton(context),
                    const SizedBox(height: 10),
                    _statusMessage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
Widget _inputFieldsPassword(BuildContext context) {
  bool obscureNewPassword = true;
  bool obscureConfirmPassword = true;

  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return Column(
        children: [
          TextField(
            controller: _newPasswordController,
            obscureText: obscureNewPassword,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              labelText: 'Nueva Contraseña',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  obscureNewPassword ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    obscureNewPassword = !obscureNewPassword;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _newRepeatPasswordController,
            obscureText: obscureConfirmPassword,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              labelText: 'Confirmar Contraseña',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    obscureConfirmPassword = !obscureConfirmPassword;
                  });
                },
              ),
            ),
          ),
        ],
      );
    },
  );
}

  Widget _submitButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          if (_newPasswordController.text ==
              _newRepeatPasswordController.text) {
            await newPasswordController.changePassword(email,
                _newPasswordController.text, _newRepeatPasswordController.text);
            if (newPasswordController.statusMessage.value ==
                "Password Changed Successfully") {
              _newPasswordController.clear();
              _newRepeatPasswordController.clear();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SuccessfulChangePassword()));
            }
          } else {
            newPasswordController.statusMessage.value =
                "Password has not changed";
          }
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          backgroundColor: TDColors.blueLogo,
        ),
        child: const Text(
          'Cambiar Contraseña',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _statusMessage() {
    return Obx(() => Text(
          newPasswordController.statusMessage.value,
          style: TextStyle(
            color: newPasswordController.statusMessage.value ==
                    "Contraseña cambiada"
                ? Colors.green
                : Colors.red,
          ),
        ));
  }
}
