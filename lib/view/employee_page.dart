import 'package:flutter/material.dart';
import '../services/cached_data.dart';
import '../services/employee_service.dart';
import '../model/employee_model.dart';
import 'employee_details_page.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  final EmployeeService _employeeService = EmployeeService();
  final CachedData _cacheManager = CachedData();
  List<Employee> employees = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    CachedData();
    loadEmployees();
  }

  Future<void> loadEmployees() async {
    try {
      final cachedEmployees = await _cacheManager.loadCachedEmployees();
      if (cachedEmployees.isNotEmpty) {
        setState(() {
          employees = cachedEmployees;
          isLoading = false;
        });
      }

      final loadedEmployees = await _employeeService.loadEmployees();
      setState(() {
        employees = loadedEmployees;
      });

      // Cache employees data
      await _cacheManager.cacheEmployees(loadedEmployees);
    } catch (error) {
      // On network error will view cached employees
      final cachedEmployees = await _cacheManager.loadCachedEmployees();
      setState(() {
        employees = cachedEmployees;
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Employee List")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
          ? Center(child: Text(errorMessage)): employees.isEmpty? const Center(child: Text("No employee cached"),)
          : ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          final employee = employees[index];
          return ListTile(
            title: Text(employee.name),
            subtitle: Text("Position: ${employee.company.bs}"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => EmployeeDetailsPage(employee: employee),
              ),
            ),
          );
        },
      ),
    );
  }
}
