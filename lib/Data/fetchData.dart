import 'package:bitcoin/Services/Networking.dart';

const String url = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '68ED95B1-710D-462C-9520-4E4C64BD8DA0';

class FetchData {
  Future fetchData(String coin, String currency) async {
    Networking net = await Networking('$url/$coin/$currency?apikey=$apiKey');
    dynamic data = net.getData();
    return data['rate'];
  }
}
