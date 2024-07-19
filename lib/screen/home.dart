import 'package:flutter/material.dart';
import 'package:rshttk/auth/crud.dart';
import 'package:rshttk/auth/link_api.dart';
import 'package:rshttk/main.dart';
import 'package:rshttk/widgets/carduesr.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with Crud {
  getNotes() async {
    var response =
        await postRequest(linkViewUesr, {"ph_id": sharedPref.getString("id")});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: const Color(0xFF247ABF),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: getNotes(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data['status'] == 'fail')
                  return const Padding(
                    padding: EdgeInsets.only(top: 300),
                    child: Center(
                        child: Text(
                      "No Roshta",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    )),
                  );
                return ListView.builder(
                  itemCount: snapshot.data['data'].length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    return CardUser(
                      ontap: () {},
                      email: "${snapshot.data['data'][i]['ph_name']}",
                      username: "${snapshot.data['data'][i]['ph_id']}",
                    );
                  },
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: Text("No data"),
                );
              }
            },
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "homepage");
              },
              child: const Text('OPen Orders'),
            ),
          ),
        ],
      ),
    );
  }
}
