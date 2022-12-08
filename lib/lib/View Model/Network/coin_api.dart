import 'package:cryptocurrency3/lib/Models/Details_models.dart';
import 'package:cryptocurrency3/lib/Models/Home_Model.dart';
import 'package:dio/dio.dart';

import '../../Models/Search_Model.dart';


class CoinApi {
  Future<List<Home_Model>> getdata() async {
    try {
      final response = await Dio().get(
          'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false');
      print(response.data);
      return List<Home_Model>.from(
          response.data.map((e) => Home_Model.fromjson(e)));
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  Future<Details_Model> getdetaildata(String id) async{
    final response = await Dio().get('https://api.coingecko.com/api/v3/coins/$id');

    return Details_Model.fromjson(response.data);
  }
  Future<List<Search_Model>> getsearchdata(String name)async{
    final response = await Dio().get('https://api.coingecko.com/api/v3/search?query=$name');

    return List<Search_Model>.from(response.data['coins'].map((e)=>Search_Model.fromjson(e)));
  }
}