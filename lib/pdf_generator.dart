import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

void generatePDF(
    {required String fullName,
    required String phoneNumber,
    required String address}) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Full Name: $fullName', style: pw.TextStyle(fontSize: 20)),
            pw.SizedBox(height: 10),
            pw.Text('Phone Number: $phoneNumber',
                style: pw.TextStyle(fontSize: 20)),
            pw.SizedBox(height: 10),
            pw.Text('Address: $address', style: pw.TextStyle(fontSize: 20)),
          ],
        );
      },
    ),
  );

  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}
