import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/petani.dart';
import 'package:flutter_application_1/Services/apiStatic.dart';
import 'package:flutter_application_1/UI/detailPetaniPage.dart';
import 'package:flutter_application_1/UI/homePage.dart';

class PetaniPage extends StatefulWidget {
  const PetaniPage({Key? key}) : super(key: key);

  @override
  _PetaniPageState createState() => _PetaniPageState();
}

class _PetaniPageState extends State<PetaniPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Petani"),
      ),
      body: FutureBuilder<List<Petani>>(
        future: ApiStatic.getPetani(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            List<Petani> listPetani = snapshot.data!;
            return Container(
              padding: EdgeInsets.all(5),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) => Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DetailPetaniPage(petani: listPetani[index])));
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(top: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.white,
                            border: Border.all(
                                width: 1, color: Colors.lightBlueAccent)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(listPetani[index].foto, width: 25),
                            Column(
                              children: [
                                Text(
                                  listPetani[index].nama,
                                  style: TextStyle(fontSize: 8),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        onTap: (i) {
          switch (i) {
            case 0:
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (BuildContext context) => HomePage()));
              break;
            case 1:
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (BuildContext context) => PetaniPage()));
              break;
            default:
          }
        },
        items: [
          // ignore: deprecated_member_use
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("home")),
          BottomNavigationBarItem(
              // ignore: deprecated_member_use
              // ignore: deprecated_member_use
              icon: Icon(Icons.supervised_user_circle),
              title: Text("petani"))
        ],
      ),
    );
  }
}
