import 'dart:convert';
import 'package:youtube/Gateway/env.dart' as env;
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:youtube/Model/VideoEntity.dart';

class Api {
  Future<List<VideoEntity>> pesquisar(String pesquisaResult) async {
    const urlSec = "${env.URL_SECUNDARIA}/search";
    var urlCompleta = Uri.https(env.URL_BASE, urlSec,{
      "part": "snippet",
      "type": "video",
      "maxResults": "50",
      "order": "date",
      "key": env.YOUTUBE_APIKEY,
      "q": "legobatman"
    });
    http.Response response = await http.get(urlCompleta);
    Map<String, dynamic> dadosJson = jsonDecode(response.body);
    List<VideoEntity> videos = dadosJson["items"].map<VideoEntity>(
        (video){
          return VideoEntity.fromJson(video);
        }
    ).toList();
    return videos;
  }
}