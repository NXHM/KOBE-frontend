import 'package:flutter/material.dart';
import 'package:myapp/constants/icons.dart';
import 'package:myapp/constants/colors.dart';
import 'package:myapp/screens/signin/enterCode.dart';
import 'package:myapp/screens/signin/signIn.dart';
import '../../controllers/forgetPasswordController.dart';
import 'package:get/get.dart';
import 'package:myapp/screens/widgets/description.dart';
import 'package:myapp/screens/widgets/titleInitialPages.dart';

class ForgetPassword extends StatelessWidget {
  final TextEditingController _forgetPasswordController = TextEditingController();
  final ForgetPasswordController forgetPasswordController = Get.put(ForgetPasswordController());

  ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: TDIcons.backArrow, 
           // Assuming TDIcons.backArrow is an IconData
          onPressed: () { // Regresar a Sign In
            //Get.toNamed('/signIn');
            Navigator.pop(
            context);
          
          },
        ),
        //title: const Text('Recuperar Contraseña'),
        //backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
          children: [
            
            TitleInitialPages(title: '¿Te olvidaste tu contraseña?'),
            Description(description: 'Ingresa tu correo electrónico vinculado para restablecer tu contraseña.'),
            //_title(context, '¿Te olvidaste tu contraseña?'),
            //_description(context, 'Ingresa tu correo electrónico vinculado para restablecer tu contraseña.'),
            _inputFieldForgetPassword(context),
            _submitButton(context),

            Obx(() => Text(
              forgetPasswordController.statusMessage.value,
              style: TextStyle(
                color: forgetPasswordController.statusMessage.value == "Email enviado" ? Colors.green : Colors.red,
              ),
            )),
          ],
        ),
      ),
        ),
      ),
    );
  }



  Widget _inputFieldForgetPassword(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 200, right: 5, left: 5),
      child: TextField(
        controller: _forgetPasswordController,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.email_rounded),
          labelText: 'Correo Electrónico',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
    );
  }

 Widget _submitButton(BuildContext context) {

    return Container(
      
      width: double.infinity,

      child: 
      Padding(padding: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: () {
          forgetPasswordController.user.value.email = _forgetPasswordController.text.trim();
          forgetPasswordController.sendEmail();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EnterCode())
          );
        },
        child: const Text('Enviar Correo', style: TextStyle(fontSize: 20),),
        style: ElevatedButton.styleFrom(

          padding: const EdgeInsets.symmetric(vertical: 15.0,),
          backgroundColor: TDColors.blueLogo, 
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
      ),
    ),
      )
    );
  }
}

