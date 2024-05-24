import 'package:flutter/material.dart';
import 'package:myapp/constants/icons.dart';
import 'package:myapp/screens/signin/signIn.dart';
import '../../controllers/newPasswordController.dart';
import 'package:get/get.dart';
import 'package:myapp/screens/widgets/description.dart';
import 'package:myapp/screens/widgets/titleInitialPages.dart';
import 'package:myapp/constants/colors.dart';


class NewPassword  extends StatelessWidget {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _newRepeatPasswordController = TextEditingController();
  final NewPasswordController newPasswordController = Get.put(NewPasswordController());

  NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: TDIcons.backArrow,  // Assuming TDIcons.backArrow is an IconData
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
            const TitleInitialPages(title: 'Nueva Contraseña'),
            const Description(description: 'Al crear su nueva contraseña, debe ser diferente de su contrasela anterior.'),
            _inputFieldsPassword(context),
            //_visualIndicator(context),
            _submitButton(context),
            Obx(() => Text(
              newPasswordController.statusMessage.value,
              style: TextStyle(
                color: newPasswordController.statusMessage.value == "Contraseña cambiada" ? Colors.green : Colors.red,
              ),
            )),
          ],
        ),
      ),
    );
  }



  Widget _inputFieldsPassword(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 150, right: 5, left: 5),
      child: Column(
      children:[
        Padding(padding: const EdgeInsets.only(bottom: 20),
        child: TextField(
        controller: _newPasswordController,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          labelText: 'Nueva Contraseña',
          hintText: 'Ingresa Contraseña',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      )
      ),
      TextField(
        controller: _newRepeatPasswordController,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          labelText: 'Confirmar Contraseña',
          hintText: 'Confirmar Contraseña',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
      ]
    )
    );
  }

  Widget _submitButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>SignIn())
          );
        },
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
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          backgroundColor: TDColors.blueLogo,
        ),),
    );
  }

  Widget _visualIndicator(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
    child:(Stack(
      children: [
      const Text(
              'Debe tener al menos 8 caracteres',
              style: TextStyle(color: Colors.grey),
            ),
      const Text(
              'Contiene al menos un número',
              style: TextStyle(color: Colors.grey),
            )
    ],)
    ));
  }
}
