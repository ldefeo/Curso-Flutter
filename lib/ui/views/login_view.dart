

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_1/providers/auth_provider.dart';
import 'package:prueba_1/providers/login_form_provider.dart';
import 'package:prueba_1/ui/inputs/custom_inputs.dart';

class LoginView extends StatelessWidget {

  final double width;
  final double height;

  const LoginView({
    super.key,
    required this.width,
    required this.height
    });

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);

    return ChangeNotifierProvider(
      create: ( _ ) => LoginFormProvider(),
      child: Builder(builder: ( context ) {
        
        final loginFormProvider = Provider.of<LoginFormProvider>(context, listen: false);

        return Container(
        width: width,
        height: height,
        color: Colors.grey[300],
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(50.0),
            width: 300,
            height: 400,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10.0)
            ),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: loginFormProvider.formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Title(color: Colors.blueGrey, child: const Text('Log In', style: TextStyle(fontSize: 24),)),
                    const SizedBox(height: 10,),
                    TextFormField(
                      onChanged: (value) => loginFormProvider.user = value,  // Se va a disparar cada vez que cambie el textformfield
                      validator: ( value ) {
                        if (value == null || value.isEmpty ) return 'Ingrese su usuario';
                        return null;
                      } ,
                      style: const TextStyle(color: Colors.black),
                      decoration: CustomInputs.loginAndRegisterDecoration(
                        hint: 'Ingrese su usuario',
                        label: 'Usuario',
                        icon: Icons.supervised_user_circle_outlined
                      ),
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      onChanged: (value) => loginFormProvider.password = value,
                      validator: ( value ) {
                        if (value == null || value.isEmpty ) return 'Ingrese su contraseña';
                        if (value.length < 8 ) return 'La contraseña debe ser de 8 caracteres o mas';
                        return null; // Valido
                      },
                      style: const TextStyle(color: Colors.black),
                      decoration: CustomInputs.loginAndRegisterDecoration(
                        hint: '********',
                        label: 'Contraseña',
                        icon: Icons.lock_outline
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20,),
                    OutlinedButton(
                      onPressed: (){
                        ( loginFormProvider.validateForm() )
                        ? authProvider.login(loginFormProvider.user, loginFormProvider.password)
                        : print('Form not valid');
                      }, 
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.arrow_forward_outlined),
                          Text('Ingresar')
                        ],
                      )
                    )
                  ],
                ),
              )
            ),
          ),
        ),
      );
    })
  );}

}