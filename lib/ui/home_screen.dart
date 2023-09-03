import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:working_api_for_dio_future_bulder/data/model/currency_model.dart';
import 'package:country_flags/country_flags.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List> getDataFromApi() async {
    var response = await Dio().get('https://nbu.uz/en/exchange-rates/json/');
    List currency = response.data
        .map(
          (curren_curency) => currencyModel.fromJson(curren_curency),
        )
        .toList();
    print('malumot keldi : ${currency[0].title}');
    return currency;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            List data = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(
                    data.length,
                    (index) => Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(color: Colors.green, offset: Offset(2, 8))
                      ]),
                      height: 70,
                      width: 300,
                      child: ListTile(
                          title: Text(data[index].title),
                          subtitle: CountryFlag.fromCountryCode(
                            data[index].code.substring(0, 2),
                            height: 48,
                            width: 62,
                            borderRadius: 8,
                          ),
                          tileColor: Colors.white,
                          onTap: () {},
                          trailing: Text(data[index].cb_price)),
                    ),
                  )
                ],
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('error'),
            );
          }
          return const Center(child: Text('nimadir boldi'));
        },
        future: getDataFromApi(),
      ),
    );
  }
}
