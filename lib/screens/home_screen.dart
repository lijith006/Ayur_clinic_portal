import 'package:ayur_clinic_portal/providers/patient_provider.dart';
import 'package:ayur_clinic_portal/screens/register_screen.dart';
import 'package:ayur_clinic_portal/widgets/custom_button.dart';
import 'package:ayur_clinic_portal/widgets/patient_card.dart';
import 'package:ayur_clinic_portal/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // fetch patients
    Future.microtask(
      () =>
          Provider.of<PatientProvider>(context, listen: false).fetchPatients(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final patientProvider = Provider.of<PatientProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            // data refresh
            await patientProvider.fetchPatients();
          },

          child: patientProvider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : patientProvider.error != null
              ? Center(child: Text("Error: ${patientProvider.error}"))
              : patientProvider.patients.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/empty_list.png'),
                      const Text('No patients available'),
                    ],
                  ),
                )
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                        left: 16,
                        right: 16,
                      ),
                      child: SearchBarWidget(
                        searchController: _searchController,
                        onSearchPressed: () {
                          //  search logic
                        },
                      ),
                    ),
                    const Divider(thickness: 1, color: Colors.grey),

                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: patientProvider.patients.length,

                        itemBuilder: (context, index) {
                          final patient = patientProvider.patients[index];

                          return PatientCard(
                            index: index,
                            name: patient.name,

                            package: patient.treatmentName,
                            date: patient.dateTime,

                            onViewDetails: () {
                              //  view details
                            },
                          );
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomButton(
                        text: 'Register Now',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const RegisterScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
