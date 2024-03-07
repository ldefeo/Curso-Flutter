

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_1/datatables/categories_source.dart';
import 'package:prueba_1/providers/categories_provider.dart';
import 'package:prueba_1/ui/buttons/add_button.dart';
import 'package:prueba_1/ui/labels/custom_labels.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {

  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage; // valor por defcto de la cantidad 
                                                            // de filas que se muestran por pagina

  @override
  void initState() {
    super.initState();
    Provider.of<CategoriesProvider>(context, listen: false).getCategories(); // listen:false porque al ponerla dentro de 
                                                                            // initState, solo se ejecuta cuando se levante por primera vez la aplicacion
                                                                            // listen:false no va si el provider se mete en el build
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Text('Categorías', style: CustomLabels.h1),

          const SizedBox(height: 30),

          PaginatedDataTable(
            columns: const [  // obligatorio (columnas de la tabla)
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Categoria')),
              DataColumn(label: Text('Creado por')),
              DataColumn(label: Text('Acciones')),
            ], 
            source: CategoriesDTS() ,  // obligatorio (definicion de filas)
            header: const Text('Categorias disponibles'), // titulo de la tabla
            onRowsPerPageChanged: (value) { 
              setState(() {
                _rowsPerPage = value ?? 10;
              }); 
            }, // contador que cambia la cantidad de filas 
              // que se muestran segun la seleccion que haga el usuario.
              // es opcional, entonces si es null le seteo 10 por defecto.
              // Hay que manejar el estado de la tabla para que este contador
              // sea efectivo y se pueda usar en rowsPerPage.
            rowsPerPage: _rowsPerPage, // cantidad de filas que muestro por cada hoja de la tabla
            actions: [  // Widgets que se pueden agregar a la tabla para realizar acciones
              AddButton(
                onPressed: (){}, 
                text: 'crear', 
                icon: Icons.add_outlined
              )
            ],
          )
        ],
      )
    );
  }
}