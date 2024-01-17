import 'package:get/get.dart';
import 'package:getx_statemanagment_mvvm/data/response/status.dart';
import 'package:getx_statemanagment_mvvm/models/home/user_list_model.dart';
import 'package:getx_statemanagment_mvvm/reposirory/home_repository/home_repository.dart';

class HomeViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    userListApi();
  }

  final _api = HomeRepository();
  final rxRequestStatus = Status.Loading.obs;
  final userList = UserListModel().obs;
  RxString error = "".obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(UserListModel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

  void userListApi() {
    //setRxRequestStatus(Status.Loading);
    _api.userListApi().then((value) {
      setRxRequestStatus(Status.Completed);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.Error);
    });
  }

  void refreshApi() {
    setRxRequestStatus(Status.Loading);
    _api.userListApi().then((value) {
      setRxRequestStatus(Status.Completed);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.Error);
    });
  }
}
