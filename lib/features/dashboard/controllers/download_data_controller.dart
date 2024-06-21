import 'dart:io';
import 'package:ecobako_app/common/widget/loaders/loaders.dart';
import 'package:ecobako_app/data/repositories/dashboard/download_data_repository.dart';
import 'package:excel/excel.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class DownloadEcoBakoDataController extends GetxController {
  static DownloadEcoBakoDataController get instance =>
      Get.put(DownloadEcoBakoDataController());
  final downloadEcoBakoData = DownloadEcoBakoData();
  var selectedStartDate = Rxn<DateTime>();
  var selectedEndDate = Rxn<DateTime>();

  Future<void> generateAndShareExcel(
      DateTime startDate, DateTime endDate) async {
    try {
      // Generate Excel
      // Fetching data for each sheet
      List<Map<String, List<Map<String, dynamic>>>> dataSets = [];

      List<Map<String, dynamic>> userData =
          await downloadEcoBakoData.getDataUsers();
      dataSets.add({"Users": userData});

      List<Map<String, dynamic>> adminDashboardData =
          await downloadEcoBakoData.getDataAdminDashboard(startDate, endDate);
      dataSets.add({"Admin Dashboard": adminDashboardData});

      List<Map<String, dynamic>> usersDashboardData =
          await downloadEcoBakoData.getDataUsersDashboard();
      dataSets.add({"User Dashboard": usersDashboardData});

      List<Map<String, dynamic>> transactionsData =
          await downloadEcoBakoData.getDataTransactions(startDate, endDate);
      dataSets.add({"Transaction": transactionsData});

      List<Map<String, dynamic>> productsData =
          await downloadEcoBakoData.getDataProducts();
      dataSets.add({"Products": productsData});

      String outputPath = await saveExcel(dataSets);

      // Share file
      if (outputPath.isNotEmpty) {
        final xFile = XFile(outputPath);
        final result = await Share.shareXFiles([xFile],
            text: 'Here is your file', subject: 'Check out this file');

        if (result != ShareResult.unavailable) {
          BakoLoaders.successSnackBar(
              title: "Success",
              message: "File download and shared successfully");
        } else {
          BakoLoaders.errorSnackBar(
              title: "Error", message: "Failed to share file");
        }
      } else {
        BakoLoaders.errorSnackBar(
            title: "Error", message: "Failed to save Excel file");
      }
    } catch (e) {
      BakoLoaders.errorSnackBar(
          title: "Error", message: "Error generating or sharing file");
    }
  }

  Future<String> saveExcel(
      List<Map<String, List<Map<String, dynamic>>>> dataSets) async {
    try {
      var excel = Excel.createExcel();

      for (var dataSet in dataSets) {
        String sheetName = dataSet.keys.first;
        List<Map<String, dynamic>> data = dataSet[sheetName]!;

        Sheet sheetObject = excel[sheetName];

        // Adding headers if required
        if (data.isNotEmpty) {
          List<String> headers = data.first.keys.toList();
          sheetObject.appendRow(
              headers.map((header) => TextCellValue(header)).toList());
        }

        // Adding rows
        for (var row in data) {
          List<CellValue> cells = row.values.map((value) {
            if (value == null) {
              return const TextCellValue(''); // Handle null values
            } else if (value is String) {
              return TextCellValue(value);
            } else if (value is int) {
              return IntCellValue(value);
            } else if (value is double) {
              return DoubleCellValue(value);
            } else if (value is bool) {
              return BoolCellValue(value);
            } else if (value is DateTime) {
              // Format the DateTime as DD/MM/YYYY
              String formattedDate = DateFormat('dd/MM/yyyy').format(value);
              return TextCellValue(formattedDate);
            } else {
              return TextCellValue(value.toString());
            }
          }).toList();

          sheetObject.appendRow(cells);
        }
      }

      final directory = await getApplicationDocumentsDirectory();
      String fileName = 'EcoBakoData_${getCurrentDateTimeString()}.xlsx';
      String outputPath = '${directory.path}/$fileName';
      File(outputPath)
        ..createSync(recursive: true)
        ..writeAsBytesSync(excel.encode()!);

      return outputPath;
    } catch (e) {
      // Handle or log the error
      print('Error saving Excel file: $e');
      return '';
    }
  }

// Function to generate current date time formatted string
  String getCurrentDateTimeString() {
    var now = DateTime.now();
    var formatter = DateFormat('ddMMyyyy_HHmm');
    return formatter.format(now);
  }

  void resetFilters() {
    selectedStartDate.value = null;
    selectedEndDate.value = null;
  }
}
