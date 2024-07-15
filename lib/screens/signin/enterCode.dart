import 'package:flutter/material.dart';
import 'package:myapp/constants/icons.dart';
import 'package:get/get.dart';
import 'package:myapp/screens/signin/newPassword.dart';
import 'package:myapp/screens/widgets/description.dart';
import 'package:myapp/screens/widgets/titleInitialPages.dart';
import 'package:myapp/constants/colors.dart';
import 'package:myapp/controllers/enterCodeController.dart';

class EnterCode extends StatelessWidget {
  final TextEditingController _enterCodeController = TextEditingController();
  final EnterCodeController enterCodeController =
      Get.put(EnterCodeController());
  final String email;

  EnterCode({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: TDIcons.backArrow,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleInitialPages(title: 'Ingresar Código'),
            Description(
                description:
                    'Ingresa el código enviado a la dirección de correo electrónico para cambiar su contraseña.'),
            _inputFieldCode(context),
            SizedBox(height: 20),
            _submitButton(context),
            SizedBox(height: 20),
            Obx(() => Text(
                  enterCodeController.statusMessage.value,
                  style: TextStyle(
                    color: enterCodeController.statusMessage.value ==
                            "Code validated successfully"
                        ? Colors.green
                        : Colors.red,
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _inputFieldCode(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: _enterCodeController,
        decoration: InputDecoration(
          labelText: 'Código de 6 caracteres',
          hintText: 'Ingrese el código de 6 caracteres',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          await enterCodeController.validateCode(email, _enterCodeController.text);
          if (enterCodeController.statusMessage.value == "Code validated successfully") {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NewPassword(email: email)));
          }
        },
        child: Text('Validar Código'),
        style: ElevatedButton.styleFrom(
          backgroundColor: TDColors.blueLogo,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
    );
  }
}