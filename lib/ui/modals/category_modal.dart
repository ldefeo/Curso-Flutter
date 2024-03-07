


import 'package:flutter/material.dart';
import 'package:prueba_1/models/category.dart';
import 'package:prueba_1/ui/inputs/custom_inputs.dart';
import 'package:prueba_1/ui/labels/custom_labels.dart';

class CategoryModal extends StatefulWidget {

  final Categoria? categoria; // para poder actualizarla, debo recibirla. Pero para crear una nueva, no

  const CategoryModal({super.key, this.categoria});

  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {

  late String nombre;
  String? id;

  @override
  void initState() {
    super.initState();

    id = widget.categoria?.id; // si estoy creando una categoria, entonces id es nulo
    nombre = widget.categoria?.nombre ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: buildBoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(widget.categoria?.nombre ?? 'Nueva Categoría', style: CustomLabels.h1.copyWith(color: Colors.white)),
                  const Spacer(),
                  IconButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    }, 
                    icon: const Icon(Icons.close_outlined, color: Colors.white)
                  ),
                ]
              ),
            ),
        
            Divider(color: Colors.white.withOpacity(0.3)),
        
            const SizedBox(height: 30),
        
            TextFormField(
              initialValue: widget.categoria?.nombre ?? '',
              onChanged:(value) => nombre = value,
              decoration: CustomInputs.loginAndRegisterDecoration(
                hint: 'Nombre de la categoría', 
                label: 'Categoría',
                icon: Icons.new_releases_outlined,
                hintColor: Colors.white.withOpacity(0.8),
                labelColor: Colors.white.withOpacity(0.9),
                iconColor: Colors.white.withOpacity(0.5)
              ),
              style: const TextStyle(
                color: Colors.white
              ),
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black26)),
                  onPressed: (){},
                  child: const Text('Guardar', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 10,)
              ],
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
    color: Color.fromARGB(255, 53, 79, 129),
    boxShadow: [
      BoxShadow(color: Colors.black26)
    ]
  );
}