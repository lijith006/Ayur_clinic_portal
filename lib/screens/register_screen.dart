import 'package:ayur_clinic_portal/core/constants.dart';
import 'package:ayur_clinic_portal/core/utils/pdf_generator.dart';
import 'package:ayur_clinic_portal/core/utils/validators.dart';
import 'package:ayur_clinic_portal/providers/branch_treatment_provider.dart';
import 'package:ayur_clinic_portal/providers/patient_provider.dart';
import 'package:ayur_clinic_portal/widgets/treatment_sheet.dart';
import 'package:flutter/material.dart';
import 'package:ayur_clinic_portal/widgets/custom_button.dart';
import 'package:ayur_clinic_portal/widgets/custom_text_form_field.dart';
import 'package:ayur_clinic_portal/widgets/custom_dropdown.dart';
import 'package:ayur_clinic_portal/widgets/treatment_card.dart';
import 'package:flutter/services.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

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
  int? _maleTreatments;
  int? _femaleTreatments;
  String? _treatmentTime;
  String? _selectedHour;
  String? _selectedMinute;
  String? _selectedTreatmentName;

  @override
  void initState() {
    super.initState();
    // fetch branches
    Future.microtask(() {
      Provider.of<BranchProvider>(context, listen: false).fetchBranches();
    });
  }

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

                    const Spacer(),
                    Icon(
                      Icons.notifications,
                      color: AppColors.iconRed,
                      size: 24.0,
                    ),
                  ],
                ),
                const Text(
                  'Register',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField(
                  label: 'Name',
                  hintText: 'Enter your full name',
                  controller: _nameController,
                ),
                CustomTextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  validator: Validator.validatePhone,
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
                Consumer<BranchProvider>(
                  builder: (context, branchProvider, child) {
                    if (branchProvider.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (branchProvider.error != null) {
                      return Text(
                        "Error: ${branchProvider.error}",
                        style: const TextStyle(color: Colors.red),
                      );
                    }
                    if (branchProvider.branches.isEmpty) {
                      return const Text("No branches available");
                    }

                    //Branch
                    return CustomDropdown(
                      label: 'Branch',
                      hintText: 'Select the branch',
                      items: branchProvider.branches
                          .map((b) => b.name)
                          .toList(),
                      value: _branch,
                      onChanged: (value) {
                        setState(() => _branch = value);
                      },
                    );
                  },
                ),
                //Treatment Card
                TreatmentCard(
                  title: _selectedTreatmentName,
                  maleCount: _maleTreatments,
                  femaleCount: _femaleTreatments,
                  onAddTreatments: () async {
                    final result = await showDialog<Map<String, dynamic>>(
                      context: context,
                      builder: (context) => const TreatmentSheet(),
                    );

                    if (result != null) {
                      print(
                        "Male: ${result['male']}, Female: ${result['female']}, Treatment: ${result['treatment']}",
                      );
                      setState(() {
                        _maleTreatments = result['male'];
                        _femaleTreatments = result['female'];
                        _selectedTreatmentName = result['treatment'];
                      });
                    }
                  },
                  onEdit: () async {
                    final result = await showDialog<Map<String, dynamic>>(
                      context: context,
                      builder: (context) => const TreatmentSheet(),
                    );

                    if (result != null) {
                      setState(() {
                        _maleTreatments = result['male'];
                        _femaleTreatments = result['female'];
                        _selectedTreatmentName = result['treatment'];
                      });
                    }
                  },
                  onDelete: () {
                    setState(() {
                      _maleTreatments = null;
                      _femaleTreatments = null;
                      _selectedTreatmentName = null;
                    });
                  },
                ),
                SizedBox(height: 20),

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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  items: const [],
                  value: _treatmentDate != null
                      ? "${_treatmentDate!.day.toString().padLeft(2, '0')}/"
                            "${_treatmentDate!.month.toString().padLeft(2, '0')}/"
                            "${_treatmentDate!.year}"
                      : null,
                  isDatePicker: true,
                  validator: Validator.validateDate,
                  onChanged: (value) {
                    setState(() {
                      if (value != null) {
                        final parts = value.split('/');
                        _treatmentDate = DateTime(
                          int.parse(parts[2]),
                          int.parse(parts[1]),
                          int.parse(parts[0]),
                        );
                      }
                    });
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomDropdown(
                        label: 'Hour',
                        hintText: 'HH',
                        items: List.generate(
                          24,
                          (index) => index.toString().padLeft(2, '0'),
                        ), // 00 - 23
                        value: _selectedHour,
                        onChanged: (value) {
                          setState(() {
                            _selectedHour = value;
                            _treatmentTime =
                                "${_selectedHour ?? '00'}:${_selectedMinute ?? '00'}";
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CustomDropdown(
                        label: 'Minutes',
                        hintText: 'MM',
                        items: ['00', '15', '30', '45'],
                        value: _selectedMinute,
                        onChanged: (value) {
                          setState(() {
                            _selectedMinute = value;
                            _treatmentTime =
                                "${_selectedHour ?? '00'}:${_selectedMinute ?? '00'}";
                          });
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16.0),
                CustomButton(
                  text: 'Save',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final patientProvider = Provider.of<PatientProvider>(
                        context,
                        listen: false,
                      );

                      final data = {
                        "id": "",
                        "name": _nameController.text,
                        "excecutive": "Some Executive",
                        "payment": _paymentOption ?? "",
                        "phone": _whatsappController.text,
                        "address": _addressController.text,
                        "total_amount": _totalAmountController.text,
                        "discount_amount": _discountAmountController.text,
                        "advance_amount": _advanceAmountController.text,
                        "balance_amount": _balanceAmountController.text,
                        "date_nd_time": DateTime.now().toString(),
                        "male": _maleTreatments?.toString() ?? "",
                        "female": _femaleTreatments?.toString() ?? "",
                        "treatments": _selectedTreatmentName ?? "",
                        "branch": _branch ?? "",
                      };

                      // await patientProvider.registerPatient(data);
                      await patientProvider.savePatient(data);

                      if (patientProvider.error == null) {
                        final pdfFile = await generatePatientReport(
                          name: _nameController.text,
                          address: _addressController.text,
                          phone: _whatsappController.text,
                          branch: _branch ?? "",
                          dateNdTime: DateTime.now().toString(),
                          treatmentDate: _treatmentDate != null
                              ? "${_treatmentDate!.day}/${_treatmentDate!.month}/${_treatmentDate!.year}"
                              : "",
                          treatmentTime: _treatmentTime ?? "",
                          treatments: [
                            {
                              "name": _selectedTreatmentName ?? "",
                              "price": 230,
                              "male": _maleTreatments ?? 0,
                              "female": _femaleTreatments ?? 0,
                              "total":
                                  230 *
                                  ((_maleTreatments ?? 0) +
                                      (_femaleTreatments ?? 0)),
                            },
                          ],
                          totalAmount:
                              double.tryParse(_totalAmountController.text) ?? 0,
                          discount:
                              double.tryParse(_discountAmountController.text) ??
                              0,
                          advance:
                              double.tryParse(_advanceAmountController.text) ??
                              0,
                          balance:
                              double.tryParse(_balanceAmountController.text) ??
                              0,
                        );

                        // Open/share PDF
                        await Printing.sharePdf(
                          bytes: await pdfFile.readAsBytes(),
                          filename: 'patient_report.pdf',
                        );

                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Patient registered successfully and PDF generated",
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Navigator.pop(context);
                        }
                      } else {
                        //  Show error
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Error: ${patientProvider.error}"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
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
