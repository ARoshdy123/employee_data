import 'package:dio/dio.dart';
import '../model/employee_model.dart';

class EmployeeService {
  final Dio _dio = Dio();
  final String endpoint = "https://jsonplaceholder.typicode.com/users";

  Future<List<Employee>> loadEmployees() async {
    try {
      final response = await _dio.get(endpoint);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Employee.fromJson (json)).toList();
      } else {
        throw Exception("Failed to fetch employees: ${response.statusCode}");
      }
    } on DioException catch (dioError) {
      throw Exception(
          "Network Error: ${dioError.response?.statusCode} - ${dioError.message}");
    } catch (error) {
      throw Exception("Unexpected Error: $error");
    }
  }
}
