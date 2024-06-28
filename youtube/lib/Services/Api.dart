import 'dart:convert';

import 'package:youtube/Gateway/env.dart' as env;
import 'dart:async';
import 'package:http/http.dart' as http;

class Api {
  pesquisar(String pesquisaResult) async {
    const urlSec = "${env.URL_SECUNDARIA}/search";
    var urlCompleta = Uri.https(env.URL_BASE, urlSec,{
      "part": "snippet",
      "type": "video",
      "maxResults": "20",
      "order": "date",
      "key": env.YOUTUBE_APIKEY,
      "channelId": env.ID_CANAL,
      "q": pesquisaResult
    });
    http.Response response = await http.get(urlCompleta);
    Map<String, dynamic> dadosJson = jsonDecode(response.body);
    if(response.statusCode == 200)
    print(dadosJson["items"][0]["snippet"]["title"]);
    else print("Deuruim");
  }
}