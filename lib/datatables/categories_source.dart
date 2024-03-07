

import 'package:flutter/material.dart';

class CategoriesDTS extends DataTableSource{
  @override
  DataRow? getRow(int index) {   // Se deben definir las filas en este metodo. 
                                // La cantidad que se definan deben coincidir con la cantidad de columns
                                // que se definieron en la PaginatedDataTable de CategoriesView
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell( Text('Cell #1 index: $index'), onTap: () => print('cel 1') ),
        DataCell( Text('Cell #2 index: $index') ),
        DataCell( Text('Cell #3 index: $index') ),
        DataCell( Text('Cell #4 index: $index') )
      ]
    );
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;  // indica si la cantidad de filas definidas en rowCount
                                          // son aproximadas o si realmente hay esa cantidad.

  @override
  // TODO: implement rowCount
  int get rowCount => 1000;    // cantidad de filas que va a haber en la tabla (puede ser un estimado)

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;

}