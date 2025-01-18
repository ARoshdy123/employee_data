import 'package:flutter/material.dart';
import '../model/employee_model.dart';

class EmployeeDetailsPage extends StatelessWidget {
  final Employee employee;

  const EmployeeDetailsPage({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(employee.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${employee.name}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text("Position: ${employee.company.bs}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text("Salary: \$${employee.address.zipcode}", style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
