// // import 'package:ecobako_app/data/repositories/dashboard/user_dashboard_repository.dart';
// // import 'package:ecobako_app/features/dashboard/models/user_dashboard_model.dart';
// // import 'package:get/get.dart';

// // class UserDashboardController extends GetxController{
// //   static UserDashboardController get instance => Get.find();

// //   final isLoading = false.obs;
// //   RxList<UserDashboardModel> userDashbaord = <UserDashboardModel>[].obs;
// //   final userDashbaordRepository = Get.put(UserDashbaordRepository());

// //   Future<void> fetchUserDashboardData(String userId) async{
// //     try {
// //       isLoading.value = true;
// //       final userData = await  userDashbaordRepository.getUserDashboardData(userId);
// //       userDashbaord.value = userData;
// //     } catch (e) {
      
// //     } finally{
// //       isLoading.value = false;
// //     }
// //   }


// // }

// import 'package:ecobako_app/data/repositories/dashboard/user_dashboard_repository.dart';
// import 'package:ecobako_app/features/dashboard/models/user_dashboard_model.dart';
// import 'package:get/get.dart';

// class UserDashboardController extends GetxController {
//   static UserDashboardController get instance => Get.find();

//   final isLoading = false.obs;
//   final userDashboard = UserDashboardModel(id: '').obs;
//   final userDashboardRepository = UserDashboardRepository();

//   Future<void> fetchUserDashboardData(String userId) async {
//     try {
//       isLoading.value = true;
//       final userData = await userDashboardRepository.getUserDashboardData(userId);
//       userDashboard.value = userData;
//     } catch (e) {
//       print("Error fetching user dashboard data: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

