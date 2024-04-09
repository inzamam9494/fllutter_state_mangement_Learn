import 'package:state_management/mvvm/data/network/BaseApiServices.dart';
import 'package:state_management/mvvm/data/network/NetworkApiService.dart';
import '../resouces/app_url.dart';

class AuthRepository{
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }

}