import 'package:weather/model/http_helper.dart';
import 'package:weather/model/player.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  TextEditingController textController = TextEditingController();
  Player result = Player('', '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cricket Screen'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                        hintText: 'Enter Player Name',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: getData,
                        )),
                  ),
                ),
                weatherRow('Name: ', result.name),
                weatherRow('Country: ', result.country),
              ],
            )));
  }

  Future getData() async {
    HttpHelper httpHelper = HttpHelper();
    result = await httpHelper.getPlayerInfo(textController.text);
    setState(() {
      result;
    });
    // print(result);
  }

  Widget weatherRow(String label, String value) {
    Widget row = Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Text(
                label,
                style:
                    TextStyle(fontSize: 20, color: Theme.of(context).hintColor),
              )),
          Expanded(
              flex: 4,
              child: Text(
                value,
                style: TextStyle(
                    fontSize: 20, color: Theme.of(context).primaryColor),
              )),
        ],
      ),
    );
    return row;
  }
}
