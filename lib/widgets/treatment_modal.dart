import 'package:ayur_clinic_portal/widgets/counter_input.dart';
import 'package:flutter/material.dart';
import 'package:ayur_clinic_portal/widgets/custom_button.dart';
import 'package:ayur_clinic_portal/widgets/custom_dropdown.dart';

class TreatmentModal extends StatefulWidget {
  final String? initialTreatment;
  final int initialMaleCount;
  final int initialFemaleCount;

  const TreatmentModal({
    Key? key,
    this.initialTreatment,
    this.initialMaleCount = 0,
    this.initialFemaleCount = 0,
  }) : super(key: key);

  @override
  _TreatmentModalState createState() => _TreatmentModalState();
}

class _TreatmentModalState extends State<TreatmentModal> {
  String? _selectedTreatment;
  int _maleCount = 0;
  int _femaleCount = 0;

  @override
  void initState() {
    super.initState();
    _selectedTreatment = widget.initialTreatment;
    _maleCount = widget.initialMaleCount;
    _femaleCount = widget.initialFemaleCount;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose Treatment',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            CustomDropdown(
              label: 'Choose preferred treatment',
              hintText: 'Choose preferred treatment',
              items: ['Couple Combo Package', 'Rejuvenation Package'],
              value: _selectedTreatment,
              onChanged: (value) => setState(() => _selectedTreatment = value),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Add Patients',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            CounterInput(
              label: 'Male',
              initialValue: _maleCount,
              onChanged: (value) => setState(() => _maleCount = value),
            ),
            const SizedBox(height: 8.0),
            CounterInput(
              label: 'Female',
              initialValue: _femaleCount,
              onChanged: (value) => setState(() => _femaleCount = value),
            ),
            const SizedBox(height: 16.0),
            CustomButton(
              text: 'Save',
              onPressed: () {
                // Handle save logic to update the TreatmentCard details
                Navigator.pop(context, {
                  'treatment': _selectedTreatment,
                  'maleCount': _maleCount,
                  'femaleCount': _femaleCount,
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
