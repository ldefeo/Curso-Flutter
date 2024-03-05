

import 'package:email_validator/email_validator.dart';
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
                      onFieldSubmitted: ( _ ) => onFormSubmit(loginFormProvider, authProvider),
                      onChanged: ( value ) => loginFormProvider.email = value,
                      validator: ( value ) {
                      if( !EmailValidator.validate(value ?? '') ) return 'Email no válido';
                        return null;
                      },
                      style: const TextStyle(color: Colors.black),
                      decoration: CustomInputs.loginAndRegisterDecoration(
                        hint: 'Ingrese su correo',
                        label: 'Email',
                      ),
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      onFieldSubmitted: ( _ ) => onFormSubmit(loginFormProvider, authProvider) , // para apretar enter y entrar directo. Se pone en todos los campos de TextFormField que tengamos
                      onChanged: (value) => loginFormProvider.password = value,
                      validator: ( value ) {
                        if (value == null || value.isEmpty ) return 'Ingrese su contraseña';
                        if (value.length < 6 ) return 'La contraseña debe ser de 6 caracteres o mas';
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
                      onPressed: () => onFormSubmit(loginFormProvider, authProvider), 
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

  void onFormSubmit(LoginFormProvider loginFormProvider, AuthProvider authProvider) {
    final validForm = loginFormProvider.validateForm();
    if (validForm) authProvider.login(loginFormProvider.email, loginFormProvider.password);
  }

}