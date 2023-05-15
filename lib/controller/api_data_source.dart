import '../service/base_network.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> loadListMovie(String text) {
    return BaseNetwork.get("s=${text}");
  }

  Future<Map<String, dynamic>> loadDetailMovie(String imdbid) {
    return BaseNetwork.get("i=" + imdbid);
  }
}
