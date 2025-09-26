import 'dart:io';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

Future<File> generatePatientReport({
  required String name,
  required String address,
  required String phone,
  required String branch,
  required String dateNdTime,
  required String treatmentDate,
  required String treatmentTime,
  required List<Map<String, dynamic>>
  treatments, // {name, price, male, female, total}
  required double totalAmount,
  required double discount,
  required double advance,
  required double balance,
}) async {
  final pdf = pw.Document();

  final logo = pw.MemoryImage(
    (await rootBundle.load('assets/logo.png')).buffer.asUint8List(),
  );

  pdf.addPage(
    pw.MultiPage(
      margin: const pw.EdgeInsets.all(20),
      build: (context) => [
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Image(logo, width: 60, height: 60),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Text(
                  "KUMARAKOM",
                  style: pw.TextStyle(
                    fontSize: 14,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.Text("Cheepunkal P.O. Kumarakom, Kottayam, Kerala - 686563"),
                pw.Text("Mob: +91 9876543210"),
                pw.Text("GST No: 32AABCU9603R1ZW"),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: 20),

        // Patient Details
        pw.Text(
          "Patient Details",
          style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 8),
        pw.Text("Name: $name"),
        pw.Text("Address: $address"),
        pw.Text("WhatsApp Number: $phone"),
        pw.SizedBox(height: 8),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text("Booked On: $dateNdTime"),
            pw.Text("Treatment Date: $treatmentDate"),
            pw.Text("Treatment Time: $treatmentTime"),
          ],
        ),
        pw.SizedBox(height: 20),

        // Treatment Table
        pw.Table.fromTextArray(
          border: pw.TableBorder.all(),
          headers: ["Treatment", "Price", "Male", "Female", "Total"],
          data: treatments
              .map(
                (t) => [
                  t['name'],
                  "₹${t['price']}",
                  t['male'].toString(),
                  t['female'].toString(),
                  "₹${t['total']}",
                ],
              )
              .toList(),
        ),
        pw.SizedBox(height: 20),

        // Amount summary
        pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              pw.Text("Total Amount: ₹$totalAmount"),
              pw.Text("Discount: ₹$discount"),
              pw.Text("Advance: ₹$advance"),
              pw.Text(
                "Balance: ₹$balance",
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
            ],
          ),
        ),

        pw.SizedBox(height: 20),
        pw.Center(
          child: pw.Text(
            "Thank you for choosing us",
            style: pw.TextStyle(color: PdfColors.green, fontSize: 14),
          ),
        ),
      ],
    ),
  );

  final output = await getTemporaryDirectory();
  final file = File("${output.path}/patient_report.pdf");
  await file.writeAsBytes(await pdf.save());
  return file;
}
