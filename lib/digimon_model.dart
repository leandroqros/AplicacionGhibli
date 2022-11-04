import 'dart:convert';
import 'dart:io';
import 'dart:async';

class Digimon {
  final String name;
  String imageUrl;
  String apiname;
  String nombreOriginal;

  int rating = 10;

  Digimon(this.name);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    HttpClient http = new HttpClient();
    try {
      if (name == "El castillo en el cielo") {
        apiname = "2baf70d1-42bb-4437-b551-e5fed5a87abe";
      } else if (name == "Mi vecino Totoro") {
        apiname = "58611129-2dbc-4a81-a72f-77ddfc1b1b49";
      } else if (name == "El viaje de Chihiro") {
        apiname = "dc2e6bd1-8156-4886-adff-b39e6043af0c";
      } else if (name == "Castillo ambulante") {
        apiname = "cd3d059c-09f4-4ff3-8d63-bc765a5184fa";
      } else if (name == "Cuentos de terramar") {
        apiname = "112c1e67-726f-40b1-ac17-6974127bb9b9";
      } else if (name == "Ponyo") {
        apiname = "758bf02e-3122-46e0-884e-67cf83df1786";
      } else if (name == "Cementerio de las luciernagas") {
        apiname = "12cfb892-aac0-4c5b-94af-521852e46d6a";
      } else if (name == "La bruja Kiki") {
        apiname = "ea660b10-85c4-4ae3-8a5f-41cea3648e3e";
      } else if (name == "Recuerdos") {
        apiname = "4e236f34-b981-41c3-8c65-f8c9000b94e7";
      } else if (name == "Porco Rosso") {
        apiname = "ebbb6b7c-945c-41ee-a792-de0e43191bd8";
      } else if (name == "Pompoko") {
        apiname = "1b67aa9a-2e4a-45af-ac98-64d6ad15b16c";
      } else if (name == "Susurros del corazon") {
        apiname = "ff24da26-a969-4f0e-ba1e-a122ead6c6e3";
      } else if (name == "Princesa Mononoke") {
        apiname = "0440483e-ca0e-4120-8c50-4c8cd9b965d6";
      } else if (name == "Mis vecinos Yamadas") {
        apiname = "45204234-adfd-45cb-a505-a8e7a676b114";
      } else if (name == "El retorno del gato") {
        apiname = "90b72513-afd4-4570-84de-a56c312fdf81";
      } else if (name == "Cuentos de Terramar") {
        apiname = "112c1e67-726f-40b1-ac17-6974127bb9b9";
      } else if (name == "Arrietty") {
        apiname = "2de9426b-914a-4a06-a3a0-5e6d9d3886f6";
      } else if (name == "La colina de las Amapoolas") {
        apiname = "45db04e4-304a-4933-9823-33f389e8d74d";
      } else if (name == "Se levanta el viento") {
        apiname = "67405111-37a5-438f-81cc-4666af60c800";
      } else if (name == "El cuento de la princesa Kagaya") {
        apiname = "578ae244-7750-4d9f-867b-f3cd3d6fecf4";
      } else if (name == "Cuando Marnie estaba aqui") {
        apiname = "5fdfb320-2a02-49a7-94ff-5ca418cae602";
      } else if (name == "La tortuga roja") {
        apiname = "d868e6ec-c44a-405b-8fa6-f7f0f8cfb500";
      } else {
        apiname = "";
      }

      //Api: https://ghibliapi.herokuapp.com/films
      var uri = new Uri.https('ghibliapi.herokuapp.com', '/films/$apiname');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();
      var dir = ']';
      var iz = '[';

      List data = json.decode('$iz$responseBody$dir');
      imageUrl = data[0]["image"];
      nombreOriginal = data[0]["original_title"];

      print(nombreOriginal);
    } catch (exception) {
      print(exception);
    }
  }
}
