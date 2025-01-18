# employee_data

Flutter Task: Employee Management that get employee data from Api and provides features like caching for offline access using `SharedPreferences`.

## Important files
-` employee_model.dart:

-Defines the structure of the Employee object and includes methods for JSON serialization and deserialization.

-`employee_service.dart

-Handles API calls to fetch employee data using the Dio library.

-`cached_data.dart

-Provides functionality to save and retrieve employee data from SharedPreferences for offline access.

-`employee_page.dart

-Displays the list of employees and manages the logic for loading cached data or fetching new data.

-`employee_details_page.dart

Displays detailed information about a selected employee.