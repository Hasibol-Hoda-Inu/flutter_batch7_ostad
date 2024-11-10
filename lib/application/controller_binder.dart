import 'package:get/get.dart';

import '../presentation/controllers/cancelled_task_list_controller.dart';
import '../presentation/controllers/completed_task_list_controller.dart';
import '../presentation/controllers/new_task_list_controller.dart';
import '../presentation/controllers/progress_task_list_controller.dart';
import '../presentation/controllers/recover_reset_password_controller.dart';
import '../presentation/controllers/recover_verify_email_controller.dart';
import '../presentation/controllers/recovery_verify_otp_controller.dart';
import '../presentation/controllers/sign_in_controller.dart';
import '../presentation/controllers/sign_up_controller.dart';
import '../presentation/controllers/task_status_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(SignInController());
    Get.put(NewTaskListController());
    Get.put(TaskStatusController());
    Get.put(CompletedTaskListController());
    Get.put(CancelledTaskListController());
    Get.put(ProgressTaskListController());
    Get.put(SignUpController());
    Get.put(RecoverResetPasswordController());
    Get.put(RecoveryVerifyOtpController());
    Get.put(RecoverVerifyEmailController());
  }
  
}