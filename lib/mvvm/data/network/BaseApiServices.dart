abstract class BaseApiServices{
  Future<dynamic> getGetApiResponse(String url, dynamic data);
  Future<dynamic> getPostApiResponse(String url,dynamic data);
}