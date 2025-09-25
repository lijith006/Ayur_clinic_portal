import 'package:ayur_clinic_portal/widgets/custom_button.dart';
import 'package:ayur_clinic_portal/widgets/patient_card.dart';
import 'package:ayur_clinic_portal/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _patients = [
    {
      'name': 'Vikram Singh',
      'package': 'Couple Combo Package (Rejuvenation...)',
      'date': '01/01/2024',
      'time': '08:00 Jithesh',
    },
    {
      'name': 'Vikram Singh',
      'package': 'Couple Combo Package (Rejuvenation...)',
      'date': '01/01/2024',
      'time': '08:00 Jithesh',
    },
    {
      'name': 'Vikram Singh',
      'package': 'Couple Combo Package (Rejuvenation...)',
      'date': '01/01/2024',
      'time': '08:00 Jithesh',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            // data refresh
            await Future.delayed(const Duration(seconds: 1));
            setState(() {
              // Refresh logic
            });
          },

          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: SearchBarWidget(
                  searchController: _searchController,
                  onSearchPressed: () {
                    //  search logic
                  },
                ),
              ),
              const Divider(thickness: 1, color: Colors.grey),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _patients.length,
                  itemBuilder: (context, index) {
                    return PatientCard(
                      name: _patients[index]['name']!,
                      package: _patients[index]['package']!,
                      date: _patients[index]['date']!,
                      time: _patients[index]['time']!,
                      onViewDetails: () {
                        //  view details
                      },
                    );
                  },
                ),
              ),
              if (_patients.isEmpty)
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/empty_list.png'), //  empty list image
                      const Text('No patients available'),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomButton(
                  text: 'Register Now',
                  onPressed: () {
                    // Handle register logic
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
