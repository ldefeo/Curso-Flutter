

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_1/models/category.dart';
import 'package:prueba_1/providers/categories_provider.dart';
import 'package:prueba_1/ui/modals/category_modal.dart';

class CategoriesDTS extends DataTableSource{

  final List<Categoria> categorias;
  final BuildContext context;

  CategoriesDTS(this.context, this.categorias);

  @override
  DataRow? getRow(int index) {   // Se deben definir las filas en este metodo. 
                                // La cantidad que se definan deben coincidir con la cantidad de columns
                                // que se definieron en la PaginatedDataTable de CategoriesView
    
    final Categoria categoria = categorias[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell( Text( categoria.id ) ),
        DataCell( Text( categoria.nombre ) ),
        DataCell( Text( categoria.usuario.nombre ) ),
        DataCell( 
          Row(
            children: [
              IconButton(
                onPressed: (){
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context, 
                    builder: ( _ ) => CategoryModal(categoria: categoria,)
                  );
                }, 
                icon: const Icon(Icons.edit_outlined)
              ),
              IconButton(
                onPressed: (){
                  final dialog = AlertDialog(
                    title: Text('Borrar la categoría: ${categoria.nombre}'),
                    content: const Text('Está seguro que desea borrar la categoría?'),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, child: const Text('Cancelar')),
                      TextButton(onPressed: () async {
                        await Provider.of<CategoriesProvider>(context, listen: false).deleteCategory(categoria.id);
                        Navigator.of(context).pop();
                      }, child: const Text('Borrar'))
                    ],
                  );

                  showDialog(context: context, builder: ( _ ) => dialog);
                }, 
                icon: Icon(Icons.delete_outline, color: Colors.red.withOpacity(0.8),)
              ),
            ],
          )
        )
      ]
    );
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;  // indica si la cantidad de filas definidas en rowCount
                                          // son aproximadas o si realmente hay esa cantidad.

  @override
  // TODO: implement rowCount
  int get rowCount => categorias.length;    // cantidad de filas que va a haber en la tabla (puede ser un estimado)

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;

}