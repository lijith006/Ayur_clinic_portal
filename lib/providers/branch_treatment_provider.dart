import 'package:ayur_clinic_portal/models/branch.dart';
import 'package:flutter/material.dart';
import 'package:ayur_clinic_portal/repositories/patient_repository.dart';

class BranchProvider extends ChangeNotifier {
  final PatientRepository repository;
  BranchProvider(this.repository);

  List<Branch> _branches = [];
  bool _isLoading = false;
  String? _error;

  List<Branch> get branches => _branches;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchBranches() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _branches = await repository.fetchBranches(); // create API in repo
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
