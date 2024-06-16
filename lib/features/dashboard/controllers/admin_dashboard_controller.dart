// import 'package:ecobako_app/data/repositories/dashboard/admin_dashboard_repository.dart';
// import 'package:ecobako_app/features/dashboard/models/admin_dashboard_models.dart';
// import 'package:ecobako_app/features/personalization/controllers/user_controller.dart';
// import 'package:get/get.dart';

// class AdminDashboardController extends GetxController {
//   static AdminDashboardController get instance =>
//       Get.put(AdminDashboardController());

//   final isLoading = false.obs;
//   final adminDashboardRepository = AdminDashboardRepository();
//   final userController = UserController();
//   bool dataFetched = false;
//   final RxBool dataFetched2 = false.obs;
//   Rx<AdminDashboardModel> adminDashboardData = AdminDashboardModel.empty().obs;
//   var adminDashboardData2 = <Map<String, dynamic>>[].obs;
//   var totalTypePPSum = 0.0.obs;
//   var totalTypePETSum = 0.0.obs;
//   var totalTypeHDPESum = 0.0.obs;
//   var totalAllPlasticSum = 0.0.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchAdminDashboardData();
//   }

//   // Future<void> fetchAdminDashboardRecord() async {
//   //   try {
//   //     isLoading.value = true;
//   //     if (!dataFetched) {
//   //       final adminDashboardData =
//   //           await adminDashboardRepository.fetchAdminDashboardData();
//   //       adminDashboardData.assignAll(adminDashboardData);
//   //       // dataFetched = true;
//   //     }
//   //   } catch (e) {
//   //     adminDashboardData(AdminDashboardModel.empty());
//   //   } finally {
//   //     dataFetched = true;
//   //     isLoading.value = false;
//   //   }
//   // }

//   Future<void> fetchAdminDashboardData() async {
//     try {
//       isLoading.value = true;
//       adminDashboardData2.value =
//           await adminDashboardRepository.getAdminDashboardData();
//       calculateTotalTypeHDPESum();
//     } catch (e) {
//       adminDashboardData2.value = [];
//       totalTypePPSum.value = 0.0;
//       totalTypePETSum.value = 0.0;
//       totalTypeHDPESum.value = 0.0;
//       totalAllPlasticSum.value = 0.0;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   void calculateTotalTypeHDPESum() {
//     double sumPP = 0.0;
//     double sumPET = 0.0;
//     double sumHDPE = 0.0;
//     double sumAllPlastic = 0.0;
//     for (var data in adminDashboardData2) {
//       if (data.containsKey('TypePP')) {
//         sumPP += data['TypePP'];
//       }

//       if (data.containsKey('TypePET')) {
//         sumPET += data['TypePET'];
//         // sumPET += (data['TypePET'] as num).toDouble();
//       }

//       if (data.containsKey('TypeHDPE')) {
//         sumHDPE += data['TypeHDPE'];
//       }

//       if (data.containsKey('TotalAllPlastic')) {
//         sumAllPlastic += data['TotalAllPlastic'];
//       }
//     }
//     totalTypePPSum.value = double.parse(sumPP.toStringAsFixed(2));
//     totalTypePETSum.value = double.parse(sumPET.toStringAsFixed(2));
//     totalTypeHDPESum.value = double.parse(sumHDPE.toStringAsFixed(2));
//     totalAllPlasticSum.value = double.parse(sumAllPlastic.toStringAsFixed(2));
//   }

//   void resetDataFetched() {
//     dataFetched = false;
//   }
// }

// class FilterController extends GetxController {
//   var selectedType = ''.obs;
//   var selectedStartDate = Rxn<DateTime>();
//   var selectedEndDate = Rxn<DateTime>();

//   void resetFilters() {
//     selectedType.value = '';
//     selectedStartDate.value = null;
//     selectedEndDate.value = null;
//   }
// }

import 'package:ecobako_app/data/repositories/dashboard/admin_dashboard_repository.dart';
import 'package:ecobako_app/features/dashboard/models/admin_dashboard_models.dart';
import 'package:ecobako_app/features/personalization/controllers/user_controller.dart';
import 'package:get/get.dart';

class AdminDashboardController extends GetxController {
  static AdminDashboardController get instance =>
      Get.put(AdminDashboardController());

  final isLoading = false.obs;
  final adminDashboardRepository = AdminDashboardRepository();
  final userController = UserController();
  bool dataFetched = false;
  final RxBool dataFetched2 = false.obs;
  Rx<AdminDashboardModel> adminDashboardData = AdminDashboardModel.empty().obs;
  var adminDashboardData2 = <Map<String, dynamic>>[].obs;
  var totalTypePPSum = 0.0.obs;
  var totalTypePETSum = 0.0.obs;
  var totalTypeHDPESum = 0.0.obs;
  var totalAllPlasticSum = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAdminDashboardData();
  }

  // Future<void> fetchAdminDashboardRecord() async {
  //   try {
  //     isLoading.value = true;
  //     if (!dataFetched) {
  //       final adminDashboardData =
  //           await adminDashboardRepository.fetchAdminDashboardData();
  //       adminDashboardData.assignAll(adminDashboardData);
  //       // dataFetched = true;
  //     }
  //   } catch (e) {
  //     adminDashboardData(AdminDashboardModel.empty());
  //   } finally {
  //     dataFetched = true;
  //     isLoading.value = false;
  //   }
  // }

  Future<void> fetchAdminDashboardData() async {
    try {
      isLoading.value = true;
      adminDashboardData2.value =
          await adminDashboardRepository.getAdminDashboardData();
      calculateTotalTypeHDPESum();
    } catch (e) {
      adminDashboardData2.value = [];
      totalTypePPSum.value = 0.0;
      totalTypePETSum.value = 0.0;
      totalTypeHDPESum.value = 0.0;
      totalAllPlasticSum.value = 0.0;
    } finally {
      isLoading.value = false;
    }
  }

  void calculateTotalTypeHDPESum() {
    double sumPP = 0.0;
    double sumPET = 0.0;
    double sumHDPE = 0.0;
    double sumAllPlastic = 0.0;
    for (var data in adminDashboardData2) {
      if (data.containsKey('TypePP')) {
        sumPP += data['TypePP'];
      }

      if (data.containsKey('TypePET')) {
        sumPET += data['TypePET'];
        // sumPET += (data['TypePET'] as num).toDouble();
      }

      if (data.containsKey('TypeHDPE')) {
        sumHDPE += data['TypeHDPE'];
      }

      if (data.containsKey('TotalAllPlastic')) {
        sumAllPlastic += data['TotalAllPlastic'];
      }
    }
    totalTypePPSum.value = double.parse(sumPP.toStringAsFixed(2));
    totalTypePETSum.value = double.parse(sumPET.toStringAsFixed(2));
    totalTypeHDPESum.value = double.parse(sumHDPE.toStringAsFixed(2));
    totalAllPlasticSum.value = double.parse(sumAllPlastic.toStringAsFixed(2));
  }

  void resetDataFetched() {
    dataFetched = false;
  }
}

class FilterController extends GetxController {
  var selectedType = ''.obs;
  var selectedStartDate = Rxn<DateTime>();
  var selectedEndDate = Rxn<DateTime>();

  void resetFilters() {
    selectedType.value = '';
    selectedStartDate.value = null;
    selectedEndDate.value = null;
  }
}

