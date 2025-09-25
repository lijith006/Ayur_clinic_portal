import 'package:ayur_clinic_portal/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:ayur_clinic_portal/widgets/custom_button.dart';
import 'package:ayur_clinic_portal/widgets/custom_text_form_field.dart';
import 'package:ayur_clinic_portal/widgets/custom_dropdown.dart';
import 'package:ayur_clinic_portal/widgets/treatment_card.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _totalAmountController = TextEditingController();
  final TextEditingController _discountAmountController =
      TextEditingController();
  final TextEditingController _advanceAmountController =
      TextEditingController();
  final TextEditingController _balanceAmountController =
      TextEditingController();
  String? _location;
  String? _branch;
  String? _paymentOption;
  DateTime? _treatmentDate;
  String? _treatmentTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.notifications,
                      color: AppColors.iconRed,
                      size: 24.0,
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField(
                  label: 'Name',
                  hintText: 'Enter your full name',
                  controller: _nameController,
                ),
                CustomTextFormField(
                  label: 'WhatsApp Number',
                  hintText: 'Enter your WhatsApp number',
                  controller: _whatsappController,
                ),
                CustomTextFormField(
                  label: 'Address',
                  hintText: 'Enter your full address',
                  controller: _addressController,
                ),
                CustomDropdown(
                  label: 'Location',
                  hintText: 'Choose your location',
                  items: [
                    'Kozhikode',
                    'Kannur',
                    'Wayanad',
                    'Kasargod',
                    'Malappuram',
                  ],
                  value: _location,
                  onChanged: (value) => setState(() => _location = value),
                ),
                CustomDropdown(
                  label: 'Branch',
                  hintText: 'Select the branch',
                  items: ['Branch 1', 'Branch 2'],
                  value: _branch,
                  onChanged: (value) => setState(() => _branch = value),
                ),

                //Treatment Card
                TreatmentCard(
                  title: '1. Couple Combo package i...',
                  details: 'Male: 2  Female: 2',
                  hasError: true,
                  onAddTreatments: () {
                    //  add treatment
                  },
                ),
                CustomButton(
                  text: '+ Add Treatments',
                  backgroundColor: AppColors.successGreen,
                  onPressed: () {
                    //  add treatments logic
                  },
                ),
                CustomTextFormField(
                  label: 'Total Amount',
                  hintText: '',
                  controller: _totalAmountController,
                ),
                CustomTextFormField(
                  label: 'Discount Amount',
                  hintText: '',
                  controller: _discountAmountController,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Payment Option',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Cash',
                            groupValue: _paymentOption,
                            onChanged: (value) =>
                                setState(() => _paymentOption = value),
                          ),
                          const Text('Cash'),
                          Radio<String>(
                            value: 'Card',
                            groupValue: _paymentOption,
                            onChanged: (value) =>
                                setState(() => _paymentOption = value),
                          ),
                          const Text('Card'),
                          Radio<String>(
                            value: 'UPI',
                            groupValue: _paymentOption,
                            onChanged: (value) =>
                                setState(() => _paymentOption = value),
                          ),
                          const Text('UPI'),
                        ],
                      ),
                    ],
                  ),
                ),
                CustomTextFormField(
                  label: 'Advance Amount',
                  hintText: '',
                  controller: _advanceAmountController,
                ),
                CustomTextFormField(
                  label: 'Balance Amount',
                  hintText: '',
                  controller: _balanceAmountController,
                ),
                CustomDropdown(
                  label: 'Treatment Date',
                  hintText: 'Choose date',
                  items: [
                    '01/01/2024',
                    '02/01/2024',
                  ], //Date PicKer--------------------------
                  value: _treatmentDate?.toString().split(' ')[0],
                  onChanged: (value) {
                    //  date selection
                  },
                ),
                CustomDropdown(
                  label: 'Treatment Time',
                  hintText: 'Minutes',
                  items: ['08:00', '09:00'], //  time picker-------------------
                  value: _treatmentTime,
                  onChanged: (value) => setState(() => _treatmentTime = value),
                ),
                const SizedBox(height: 16.0),
                CustomButton(
                  text: 'Save',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      //  save logic
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
