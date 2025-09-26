import 'package:ayur_clinic_portal/core/api_client.dart';
import 'package:ayur_clinic_portal/models/branch.dart';
import 'package:ayur_clinic_portal/models/patient.dart';

class PatientRepository {
  final ApiClient apiClient;
  PatientRepository(this.apiClient);

  Future<List<Patient>> fetchPatients() async {
    final response = await apiClient.get('/PatientList');
    print("PatientList API response: $response");

    // response is  Map<String, dynamic>
    if (response['status'] == true && response['patient'] != null) {
      final List<dynamic> data = response['patient'];
      return data.map((e) => Patient.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<bool> registerPatient(Map<String, String> patientData) async {
    final response = await apiClient.post('/PatientUpdate', body: patientData);
    return response['status'] == true;
  }

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
