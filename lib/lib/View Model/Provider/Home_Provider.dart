
import 'package:cryptocurrency3/lib/View%20Model/Network/dio_exceptions%20(1).dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Models/Home_Model.dart';
import '../Network/coin_api.dart';

class HomeProvider extends ChangeNotifier {
  List<Home_Model> coinlist = [];

  HomeProvider(){
    getallcoin();
  }

  getallcoin() async {
    try {
      await CoinApi().getdata().then((value) {
        coinlist = value;
        print(value);
        notifyListeners();
      });
    }
    on DioError catch (e) {
      String error = DioExceptions.fromDioError(e).toString();
      print(error);
      Get.dialog(
        AlertDialog(
          title: Text("Error"),
          content: Text(error),
          actions: [
            TextButton(onPressed: () {
              getallcoin();
              Get.back();
            },

              child: Text("ok"),
            ),
          ],
        ),
      );
    }
  }
}