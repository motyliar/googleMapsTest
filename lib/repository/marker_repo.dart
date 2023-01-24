import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:googlemap/models/marker_model.dart';


class MarkerRepository {

  Future<List<MarkerModel>> markerRepository() async {
    final String markerRepo = await rootBundle.loadString('assets/markers.json');
    final List data = await jsonDecode(markerRepo)["markers"];

    return data.map((e) => MarkerModel.fromJson(e)).toList();


  }
}



// class RepoJson {
//   Future<List<RoadModels>> repoJson() async {
//     final String repo = await rootBundle.loadString('assets/samples.json');
//     final List data = await json.decode(repo)["nowaziemia"];

//     return data.map(((e) => RoadModels.fromJson(e))).toList();
//   }

//   Future<List<RoadModels>> repoJson2() async {
//     final String repo = await rootBundle.loadString('assets/samples.json');
//     final List data = await json.decode(repo)["nowaziemia"];

//     return data.map(((e) => RoadModels.fromJson(e))).toList();
//   }
// }