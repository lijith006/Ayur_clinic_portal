import 'package:ayur_clinic_portal/models/patient.dart';
import 'package:flutter/material.dart';
import 'package:ayur_clinic_portal/repositories/patient_repository.dart';

class PatientProvider extends ChangeNotifier {
  final PatientRepository repository;
  PatientProvider(this.repository);

  List<Patient> _patients = [];
  bool _isLoading = false;
  String? _error;

  List<Patient> get patients => _patients;
  bool get isLoading => _isLoading;
  String? get error => _error;
  //fetch patients
  Future<void> fetchPatients() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _patients = await repository.fetchPatients();
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  //register patients
  Future<void> savePatient(
    Map<String, String> patientData, {
    String? id,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final success = await repository.savePatient(patientData, id: id ?? "");
      if (success) {
        await fetchPatients();
      } else {
        _error = "Failed to save patient";
      }
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
