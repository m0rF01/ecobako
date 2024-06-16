// import 'package:get/get.dart';

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

// class AdminDashboardController extends GetxController {
//   static AdminDashboardController get instance => Get.find();
//   final filterController = Get.find<FilterController>();

//   var totalTypePPSum = 0.obs;
//   var totalTypePETSum = 0.obs;
//   var totalTypeHDPESum = 0.obs;
//   var totalAllPlasticSum = 0.obs;
//   var dataFetched = false.obs;

//   void resetDataFetched() {
//     dataFetched.value = false;
//   }

//   Future<void> fetchAdminDashboardData() async {
//     // Use filterController.selectedType.value,
//     // filterController.selectedStartDate.value, and
//     // filterController.selectedEndDate.value to fetch filtered data
//     // For example, you can fetch data like this:
    
//     var selectedType = filterController.selectedType.value;
//     var selectedStartDate = filterController.selectedStartDate.value;
//     var selectedEndDate = filterController.selectedEndDate.value;

//     // Implement your data fetching logic here using the selectedType and date range

//     dataFetched.value = true; // Set this to true once data is fetched
//   }
// }
