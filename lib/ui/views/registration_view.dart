

import 'package:flutter/material.dart';
import 'package:prueba_1/ui/inputs/custom_inputs.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[400],
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(50.0),
          width: 600,
          height: 600,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextFormField(
                          //validator: ,
                          style: const TextStyle(color: Colors.black),
                          decoration: CustomInputs.loginAndRegisterDecoration(
                            hint: 'Ingrese su Nombre y Apellido',
                            label: 'Nombre y Apellido',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(    // Para que los textform ocupen el espacio disponible de manera equitativa
                        child: TextFormField(
                          //validator: ,
                          style: const TextStyle(color: Colors.black),
                          decoration: CustomInputs.loginAndRegisterDecoration(
                            hint: 'Edad',
                            label: 'Edad',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  TextFormField(
                    validator: ( value ) {
                      if (value == null ) return 'Ingrese su usuario';
                      return null;
                    } ,
                    style: const TextStyle(color: Colors.black),
                    decoration: CustomInputs.loginAndRegisterDecoration(
                      hint: 'Ingrese su usuario',
                      label: 'Usuario',
                    ),
                  ),
                  const SizedBox(height: 30,),
                  TextFormField(
                    validator: ( value ) {
                      if (value == null ) return 'Ingrese su contraseña';
                      if (value.length < 8 ) return 'La contraseña debe ser de 8 caracteres o mas';
                      return null; // Valido
                    },
                    style: const TextStyle(color: Colors.black),
                    decoration: CustomInputs.loginAndRegisterDecoration(
                      hint: '********',
                      label: 'Contraseña',
                    ),
                  ),
                  const SizedBox(height: 50,),
                  OutlinedButton(
                    onPressed: (){}, 
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
          )
        )
      )
    );
  }
}