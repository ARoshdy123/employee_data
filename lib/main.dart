import 'package:flutter/material.dart';

import 'view/employee_page.dart';


void main() {
  runApp(const EmployeeData());
}

class EmployeeData extends StatelessWidget {
  const EmployeeData({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employee Data',
      home: EmployeePage(),
    );
  }
}
