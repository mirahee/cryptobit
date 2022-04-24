import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CryBit extends StatelessWidget {
  const CryBit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              height: 180,
              child: Center(
                child: Image.asset('assets/images/Bitcoin.png'),
              )),
          Container(child: const SecondForm()),
        ]),
      ),
    );
  }
}

class SecondForm extends StatefulWidget {
  const SecondForm({Key? key}) : super(key: key);

  @override
  State<SecondForm> createState() => _SecondFormState();
}

class _SecondFormState extends State<SecondForm> {

  String selectcrypto = "btc", selectfiat = "usd", description = "no data";
  late String value;

  //double cryptorates = 0.0;
  //var fiatrates;
  List<String> cryptoList = [
    "btc",
    "eth",
    "ltc",
    "bhc",
    "bnb",
    "eos",
    "xrp",
    "xlm",
    "link",
    "dot",
    "yfi",
  ];

  List<String> fiatList = [
    "usd",
    "aed",
    "ars",
    "aud",
    "bdt",
    "bhd",
    "bmd",
    "brl",
    "cad",
    "chf",
    "clp",
  ];

  get fromTextController => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: [
          const Text(
            "BitCoin cryptocurrency exchange",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: fromTextController,
            textAlign: TextAlign.center,
            keyboardType: const TextInputType.numberWithOptions(),
            decoration: InputDecoration(
              hintText: "cryto amount",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
          DropdownButton(
            itemHeight: 60,
            value: selectcrypto,
            onChanged: (newValue) {
              setState(() {
                selectcrypto = newValue.toString();
              });
            },
            items: cryptoList.map((selectcrypto) {
              return DropdownMenuItem(
                child: Text(
                  selectcrypto,
                ),
                value: selectcrypto,
              );
            }).toList(),
          ),
          DropdownButton(
            itemHeight: 60,
            value: selectfiat,
            onChanged: (newValue) {
              setState(() {
                selectfiat = newValue.toString();
              });
            },
            items: fiatList.map((selectfiat) {
              return DropdownMenuItem(
                child: Text(
                  selectfiat,
                ),
                value: selectfiat,
              );
            }).toList(),
            
          ),
          ElevatedButton(onPressed: _loadcrypto, child: const Text("Exchange")),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Future<void> _loadcrypto() async {
    var url = Uri.parse("https://api.coingecko.com/api/v3/exchange_rates");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      var parseData = json.decode(jsonData);
      value = parseData['rates']['value'];
      setState(() {
        description =
            "The value exchange is $value";
      });
      //progressDialog.dismiss();
    }
  }
}
