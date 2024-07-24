// import 'package:syncfusion_flutter_datagrid/datagrid.dart';
// import 'package:flutter/material.dart';

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//       body: SfDataGrid(
//     source: _employeeDataSource,
//     allowSorting: true,
//     allowMultiColumnSorting: true,
//     columns: [
//       GridColumn(
//           columnName: 'id',
//           label: Container(
//               padding: EdgeInsets.symmetric(horizontal: 16.0),
//               alignment: Alignment.centerRight,
//               child: Text(
//                 'ID',
//                 overflow: TextOverflow.ellipsis,
//               ))),
//       GridColumn(
//           columnName: 'name',
//           label: Container(
//               padding: EdgeInsets.symmetric(horizontal: 16.0),
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'Name',
//                 overflow: TextOverflow.ellipsis,
//               ))),
//       GridColumn(
//           columnName: 'city',
//           label: Container(
//               padding: EdgeInsets.symmetric(horizontal: 16.0),
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'City',
//                 overflow: TextOverflow.ellipsis,
//               ))),
//       GridColumn(
//           columnName: 'freight',
//           label: Container(
//               padding: EdgeInsets.symmetric(horizontal: 16.0),
//               alignment: Alignment.centerRight,
//               child: Text(
//                 'Freight',
//                 overflow: TextOverflow.ellipsis,
//               ))),
//     ],
//   ));
// }