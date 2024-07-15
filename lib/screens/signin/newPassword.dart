import 'package:flutter/material.dart';
import 'package:myapp/constants/icons.dart';
import 'package:myapp/screens/signin/signIn.dart';
import '../../controllers/newPasswordController.dart';
import 'package:get/get.dart';
import 'package:myapp/screens/widgets/description.dart';
import 'package:myapp/screens/widgets/titleInitialPages.dart';
import 'package:myapp/constants/colors.dart';

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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Usar un Icon predeterminado
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleInitialPages(title: 'Nueva Contraseña'),
              const SizedBox(height: 10),
              const Description(
                  description:
                      'Al crear su nueva contraseña, debe ser diferente de su contraseña anterior.'),
              const SizedBox(height: 20),
              _inputFieldsPassword(context),
              const SizedBox(height: 20),
              _submitButton(context),
              const SizedBox(height: 10),
              Obx(() => Text(
                    newPasswordController.statusMessage.value,
                    style: TextStyle(
                      color: newPasswordController.statusMessage.value ==
                              "Contraseña cambiada"
                          ? Colors.green
                          : Colors.red,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputFieldsPassword(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _newPasswordController,
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock),
            labelText: 'Nueva Contraseña',
            hintText: 'Ingresa Contraseña',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _newRepeatPasswordController,
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock),
            labelText: 'Confirmar Contraseña',
            hintText: 'Confirmar Contraseña',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _submitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (_newPasswordController.text == _newRepeatPasswordController.text) {
          await newPasswordController.changePassword(
              email, _newPasswordController.text, _newRepeatPasswordController.text);
          if (newPasswordController.statusMessage.value ==
              "Contraseña cambiada") {
            _newPasswordController.clear();
            _newRepeatPasswordController.clear();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => SignIn()));
          }
        } else {
          newPasswordController.statusMessage.value =
              "Las contraseñas no coinciden";
        }
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        backgroundColor: TDColors.blueLogo,
      ),
      child: const SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            'Cambiar Contraseña',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
