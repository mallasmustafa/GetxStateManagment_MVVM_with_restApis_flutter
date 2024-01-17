import 'package:getx_statemanagment_mvvm/data/app_exceptions.dart';
import 'package:getx_statemanagment_mvvm/data/network/network_api_services.dart';
import 'package:getx_statemanagment_mvvm/models/home/user_list_model.dart';
import 'package:getx_statemanagment_mvvm/res/app_url/app_url.dart';
import 'package:getx_statemanagment_mvvm/res/components/internet_exceptions_widget.dart';

class HomeRepository {
  final _apiService = NetworkApiServices();

  Future userListApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrl.userListApi);
      return UserListModel.fromJson(response);
    } catch (e) {
      if (e is InternetException) {
        return InternetExceptionWidget(onPress: () {});
      }
    }
  }
}
