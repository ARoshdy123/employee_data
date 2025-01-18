import 'package:shared_preferences/shared_preferences.dart';
import '../model/employee_model.dart';

class CachedData {
  static const String employeeCache = "cached_employees";

  Future<void> cacheEmployees(List<Employee> employees) async {
    final prefs = await SharedPreferences.getInstance();
    final employeeJson = employeesToJson(employees);
    await prefs.setString(employeeCache, employeeJson);
  }

  Future<List<Employee>> loadCachedEmployees() async {
    final prefs = await SharedPreferences.getInstance();
    final employeeJson = prefs.getString(employeeCache);
    if (employeeJson != null) {
      return employeesFromJson(employeeJson);
    }
    return [];
  }
}
