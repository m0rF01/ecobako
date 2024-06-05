import 'package:ecobako_app/data/repositories/dashboard/user_dashboard_repository.dart';
import 'package:ecobako_app/features/dashboard/models/user_dashboard_model.dart';
import 'package:ecobako_app/features/personalization/controllers/user_controller.dart';
import 'package:get/get.dart';

class UserDashboardController extends GetxController {
  static UserDashboardController get instance =>
      Get.put(UserDashboardController());

  final isLoading = false.obs;
  final userDashboardRepository = UserDashboardRepository();
  final userController = UserController();
  bool dataFetched = false;
  final RxBool dataFetched2 = false.obs;
  Rx<UserDashboardModel> userDashboardData = UserDashboardModel.empty().obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }
  Future<void> fetchUserRecord() async {
    try {
      isLoading.value = true;
      if (!dataFetched) {
        final userId = await userController.getCurrentUserId();
        final userDashboardData =
            await userDashboardRepository.fetchUserDashboardData(userId);
        this.userDashboardData(userDashboardData);
        // dataFetched = true;
      }
    } catch (e) {
      userDashboardData(UserDashboardModel.empty());
    } finally {
      dataFetched = true;
      isLoading.value = false;
    }
  }

  void resetDataFetched() {
    dataFetched = false;
  }
}
