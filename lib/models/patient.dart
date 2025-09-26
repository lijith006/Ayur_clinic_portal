// class Patient {
//   final int id;
//   final String name;
//   final String package;
//   final String date;
//   final String time;

//   Patient({
//     required this.id,
//     required this.name,
//     required this.package,
//     required this.date,
//     required this.time,
//   });

//   factory Patient.fromJson(Map<String, dynamic> json) {
//     return Patient(
//       id: json['id'] ?? 0,
//       name: json['name'] ?? '',
//       package: json['package'] ?? '',
//       date: json['date'] ?? '',
//       time: json['time'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'package': package,
//       'date': date,
//       'time': time,
//     };
//   }
// }
// class Patient {
//   final int id;
//   final String name;
//   final String phone;
//   final String address;
//   final String payment;
//   final DateTime dateTime;
//   final String branchName;
//   final String treatmentName;

//   Patient({
//     required this.id,
//     required this.name,
//     required this.phone,
//     required this.address,
//     required this.payment,
//     required this.dateTime,
//     required this.branchName,
//     required this.treatmentName,
//   });

//   factory Patient.fromJson(Map<String, dynamic> json) {
//     return Patient(
//       id: json['id'],
//       name: json['name'] ?? '',
//       phone: json['phone'] ?? '',
//       address: json['address'] ?? '',
//       payment: json['payment'] ?? '',
//       dateTime: DateTime.tryParse(json['date_nd_time'] ?? '') ?? DateTime.now(),
//       branchName: json['branch']?['name'] ?? '',
//       treatmentName:
//           (json['patientdetails_set'] != null &&
//               json['patientdetails_set'].isNotEmpty)
//           ? json['patientdetails_set'][0]['treatment_name'] ?? ''
//           : '',
//     );
//   }
// }

class Patient {
  final int id;
  final String name;
  final String treatmentName;
  final DateTime dateTime;

  Patient({
    required this.id,
    required this.name,
    required this.treatmentName,
    required this.dateTime,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      treatmentName:
          (json['patientdetails_set'] != null &&
              json['patientdetails_set'].isNotEmpty)
          ? json['patientdetails_set'][0]['treatment_name'] ?? ''
          : '',
      dateTime: json['date_nd_time'] != null
          ? DateTime.parse(json['date_nd_time'])
          : DateTime.now(), // fallback if null
    );
  }
}
