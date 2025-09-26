import 'package:ayur_clinic_portal/core/api_client.dart';
import 'package:ayur_clinic_portal/models/branch.dart';
import 'package:ayur_clinic_portal/models/patient.dart';

class PatientRepository {
  final ApiClient apiClient;
  PatientRepository(this.apiClient);

  //fetch patients
  Future<List<Patient>> fetchPatients() async {
    final response = await apiClient.get('/PatientList');
    print("PatientList API response: $response");

    if (response['status'] == true && response['patient'] != null) {
      final List<dynamic> data = response['patient'];
      return data.map((e) => Patient.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<bool> savePatient(
    Map<String, String> patientData, {
    String? id,
  }) async {
    final body = Map<String, String>.from(patientData);

    //
    body["id"] = id ?? body["id"] ?? "";

    final response = await apiClient.post('/PatientUpdate', body: body);
    print("PatientUpdate API response: $response");

    return response['status'] == true;
  }

  //fetch branches
  Future<List<Branch>> fetchBranches() async {
    final response = await apiClient.get("/BranchList");
    if (response['status'] == true) {
      final List<dynamic> branchList = response['branches'];
      return branchList.map((b) => Branch.fromJson(b)).toList();
    } else {
      throw Exception(response['message'] ?? "Failed to fetch branches");
    }
  }
}
